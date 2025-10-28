import prisma from "../prisma/client.js";

export const createNoteService = async (data: { title: string; content: string; userId: number }) => {
  return await prisma.note.create({ data });
};

export const getNotesByUserService = async (userId: number) => {
  return await prisma.note.findMany({ where: { userId } });
};
