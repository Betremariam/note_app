import { Router } from "express";
import { createNote, getNotesByUser } from "../controller/notes.controller.js";

const router = Router();

router.post("/", createNote);
router.get("/:userId", getNotesByUser);

export default router;
