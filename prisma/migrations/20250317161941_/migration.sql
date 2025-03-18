/*
  Warnings:

  - You are about to drop the column `PlayerIdentity` on the `GameServerConnections` table. All the data in the column will be lost.
  - Added the required column `identity` to the `GameServerConnections` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "GameServerConnections" DROP COLUMN "PlayerIdentity",
ADD COLUMN     "identity" TEXT NOT NULL;
