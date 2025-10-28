import type { Request, Response } from "express";
import { createNoteService, getNotesByUserService } from "../services/notes.service.js";

export const createNote = async (req: Request, res: Response) => {
  try {
    const note = await createNoteService(req.body);
    res.json(note);
  } catch (error) {
    res.status(400).json({ message: "Error creating note", error });
  }
};

export const getNotesByUser = async (req: Request, res: Response) => {
  try {
    const { userId } = req.params;
    if (!userId) {
      return res.status(400).json({ message: "Missing userId param" });
    }
    const parsedId = parseInt(userId, 10);
    if (Number.isNaN(parsedId)) {
      return res.status(400).json({ message: "Invalid userId param" });
    }
    const notes = await getNotesByUserService(parsedId);
    res.json(notes);
  } catch (error) {
    res.status(400).json({ message: "Error fetching notes", error });
  }
};
