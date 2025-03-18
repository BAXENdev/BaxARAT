import Image from "next/image";
import styles from "./page.module.css";
import { Button, Link } from "@chakra-ui/react"

export default function Home() {
  return (
    <div className={styles.page}>
      <main className={styles.main}>
        <Link href="/playerViewer">
          <Button>SearchPlayers</Button>
        </Link>
      </main>
      <footer className={styles.footer}>
        
      </footer>
    </div>
  );
}
