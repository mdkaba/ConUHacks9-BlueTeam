import './App.css';
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import FormPage from "./Form.jsx";

const App = () => {
  return (
    <Router>
        <Routes>
          <Route path="/" element={<FormPage />} />       
        </Routes>
    </Router>
  );
};

export default App;
