-- CreateTable
CREATE TABLE "PlayerMessages" (
    "id" SERIAL NOT NULL,
    "identity" TEXT NOT NULL,
    "ipPort" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "messageTime" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlayerMessages_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PlayerMessages_identity_idx" ON "PlayerMessages"("identity");

-- CreateIndex
CREATE INDEX "PlayerMessages_ipPort_idx" ON "PlayerMessages"("ipPort");

-- CreateIndex
CREATE UNIQUE INDEX "PlayerMessages_identity_ipPort_messageTime_key" ON "PlayerMessages"("identity", "ipPort", "messageTime");

-- AddForeignKey
ALTER TABLE "PlayerMessages" ADD CONSTRAINT "PlayerMessages_identity_fkey" FOREIGN KEY ("identity") REFERENCES "Players"("identity") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerMessages" ADD CONSTRAINT "PlayerMessages_ipPort_fkey" FOREIGN KEY ("ipPort") REFERENCES "GameServers"("ipPort") ON DELETE RESTRICT ON UPDATE CASCADE;
