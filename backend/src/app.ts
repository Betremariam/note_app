import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import userRoutes from "./routes/users.routes.js";
import noteRoutes from "./routes/notes.routes.js";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/users", userRoutes);
app.use("/api/notes", noteRoutes);

export default app;
