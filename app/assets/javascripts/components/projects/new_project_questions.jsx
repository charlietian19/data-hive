class AddRemoveProjectQuestions extends React.Component{

  constructor(props) {
    super(props);
    this.state = {questions: 3};
  }
  _addQuestion = () => {
    let next = this.state.questions + 1
    this.setState({ questions: next });
  }

  _removeQuestion = () => {
    if (this.state.questions > 0) {
      prev = this.state.questions - 1;
      this.setState( {questions: prev } );
    }

  }

  render () {
    var q = [];
      for (var i = 1; i <= this.state.questions; i++) {
        q.push(i);
      }
    let form_questions = q.map((i) => {
      return (
      <div key={i}>
        <fieldset className="input-container">
          <label>Question</label>
            <textarea placeholder="Add a question" name="questions[]"/>
        </fieldset>
      </div>
      )
    })
    return (
      <div>
        {form_questions}
        <div className="button" onClick={this._addQuestion}>Add a question</div>
        <div className="button" onClick={this._removeQuestion}>Remove a question</div>
      </div>
    )
  }
}
