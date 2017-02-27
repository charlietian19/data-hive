class PhoneInputMask extends React.Component {
  constructor(props) {
    super(props);
  }

  _checkTextSelected = (input) => {
    return input.selectionStart !== input.selectionEnd;
  }

  _handleInput = (e) => {

    // Validate the input to allow numbers only
    let entry = parseInt(e.key);
    if (!entry && entry != 0) {
      e.preventDefault();
    }

    // If the user has selected text, resume default behavior
    if (this._checkTextSelected(e.target)) {
      return true;
    }

    let input = e.target.value;
    let rawNum = input.split("-").join("");
    let formattedNum;

    if (rawNum.length >= 10) {
      e.preventDefault();
      return;
    }

    if (rawNum.length == 3) {
      formattedNum = rawNum + "-";
    } else if (rawNum.length > 3 && rawNum.length < 6) {
      formattedNum = rawNum.substring(0, 3) + "-" + rawNum.substring(3, rawNum.length);
    } else if (rawNum.length >= 6) {
      formattedNum = rawNum.substring(0, 3) + "-" + rawNum.substring(3, 6);
      formattedNum += "-" + rawNum.substring(6, rawNum.length);
    } else {
      formattedNum = rawNum;
    }

    this._setInputVal(e.target, formattedNum);
  }

  _setInputVal = (input, value) => {
    input.value = value;
  }

  render() {
    return (
      <div>
        <input
          value={this.props.phone}
          type="tel" name="user[phone_number]"
          onKeyPress={this._handleInput} placeholder="123-456-7890"
          onChange={this.props.change} />
      </div>
    )
  }
}
