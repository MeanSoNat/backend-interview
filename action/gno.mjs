import { randomBytes } from "crypto";

export const gno = async () => {
  const token = await randomBytes(64).toString("hex");
  return token;
};
