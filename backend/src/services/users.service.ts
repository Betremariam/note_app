import prisma from "../prisma/client.js";

export const createUserService = async (data: { name: string; email: string }) => {
  return await prisma.user.create({ data });
};

export const getUsersService = async () => {
  return await prisma.user.findMany();
};
