import express from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const prisma = new PrismaClient();

app.use(express.json());

// 📝 Create a note
app.post("/notes", async (req, res) => {
  const { title, content } = req.body;
  const note = await prisma.note.create({
    data: { title, content },
  });
  res.json(note);
});

// 📋 Get all notes
app.get("/notes", async (req, res) => {
  const notes = await prisma.note.findMany({
    orderBy: { createdAt: "desc" },
  });
  res.json(notes);
});

const PORT = 4000;
app.listen(PORT, () => console.log(`🚀 Server running on http://localhost:${PORT}`));
