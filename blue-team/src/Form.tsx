import "./Form.css";
import { useState } from "react";

export default function StudentForm() {
  return (
    <div className="container">
      <div className="form-wrapper">
        <h2 className="form-title">Student Financial Form</h2>
        <form className="form">
          <div className="form-group">
            <label htmlFor="major">Major</label>
            <input type="text" id="major" className="form-input" />
          </div>
          
          <div className="form-group">
            <label htmlFor="credits">Number of Credits</label>
            <input type="number" id="credits" className="form-input" />
          </div>

          <div className="form-group">
            <label htmlFor="cost">Cost per Credit ($)</label>
            <input type="number" id="cost" className="form-input" step=".01"/>
          </div>

          <div className="form-group">
            <label htmlFor="liquidity">Total Available Liquidity ($)</label>
            <input type="number" id="liquidity" className="form-input" step=".01"/>
          </div>

          <button type="submit" className="submit-button">Submit</button>
        </form>
      </div>
    </div>
  );
}