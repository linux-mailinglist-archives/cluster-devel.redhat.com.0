Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF4B4F8BE7
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Apr 2022 04:12:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-hMuLGxYHPcuJ_6dtT4o0pQ-1; Thu, 07 Apr 2022 22:12:05 -0400
X-MC-Unique: hMuLGxYHPcuJ_6dtT4o0pQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FB3E2A5955E;
	Fri,  8 Apr 2022 02:12:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C73DAC28126;
	Fri,  8 Apr 2022 02:12:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4133A1940349;
	Fri,  8 Apr 2022 02:12:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B6B081949761 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 02:11:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 938DC40D284F; Fri,  8 Apr 2022 02:11:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FA4C40D2848
 for <cluster-devel@redhat.com>; Fri,  8 Apr 2022 02:11:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3668D1014A65
 for <cluster-devel@redhat.com>; Fri,  8 Apr 2022 02:11:59 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-D7HTZMOUPMeDWk0fi-1rBQ-1; Thu, 07 Apr 2022 22:11:55 -0400
X-MC-Unique: D7HTZMOUPMeDWk0fi-1rBQ-1
Received: by mail-qk1-f176.google.com with SMTP id b33so3775737qkp.13;
 Thu, 07 Apr 2022 19:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKIfSJ4IWaVGr7yR5YeTRm1BmHoNWFn5MvTethYbLJo=;
 b=SjPemuYsT0qY3IgBmV2AFlAqXe7SO20kRrxA6x9UXSBwd6yEgNRBxXSHdXCKN0QUl1
 0JLeAYACDkWRh3dFesdFbdwUNaqNnU2TVzca2yc1ORrHun4LUx2ccaXkRF6EIY+9HLc5
 RLNrTRXgQYieyBAgAzaxyp2jO/TwPiZVYfCI6RxBRPuESXpYHy01S34/IVZpMYVJsgP4
 VkcEaKc3netqIEtR2/3CkNKHMxr6LCzsEDBhmt5/2/86vKTNu+h9tAVP3HOGl3IGAcVM
 pAJ3T+w4KSt6IBx4l5rB6OvkwCytbaCWj7QqvROoYurqO9B/rFEh71FYC4sRfnNpCkNt
 oZvQ==
X-Gm-Message-State: AOAM531lqYUUxVOw/24y9A9USufIZoV3QGZD46CJcg9cow+0zeS5u3JM
 ER0wwUL4NkVaGg1djO9Sqr4=
X-Google-Smtp-Source: ABdhPJyOwjkr/l7RR4KlPoSKT7cWkib7NEVhOobuqOTGZ4Y3Nn4TovO2hNKoV+uH2XyAZKipJP3Z+w==
X-Received: by 2002:a37:e307:0:b0:67d:374c:aba1 with SMTP id
 y7-20020a37e307000000b0067d374caba1mr11179686qki.752.1649383915140; 
 Thu, 07 Apr 2022 19:11:55 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac85ac2000000b002e1cc2d363asm17551038qtd.24.2022.04.07.19.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 19:11:54 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: dsterba@suse.com,
	tytso@mit.edu
Date: Fri,  8 Apr 2022 02:11:36 +0000
Message-Id: <20220408021136.2493147-1-lv.ruyi@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v2] fs: remove unnecessary conditional
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: matthew.garrett@nebula.com, linux-efi@vger.kernel.org,
 linux-cifs@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, samba-technical@lists.samba.org,
 josef@toxicpanda.com, linux-kernel@vger.kernel.org, sfrench@samba.org,
 clm@fb.com, cluster-devel@redhat.com, adilger.kernel@dilger.ca, jk@ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, ardb@kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true

From: Lv Ruyi <lv.ruyi@zte.com.cn>

iput() has already handled null and non-null parameter, so it is no
need to use if().

This patch remove all unnecessary conditional in fs subsystem.
No functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
chang log: v1 -> v2
change subject from "remove redundant judgment" to
"remove unnecessary conditional", and combine into a patch.
---
 fs/btrfs/relocation.c | 3 +--
 fs/btrfs/tree-log.c   | 3 +--
 fs/cifs/dir.c         | 3 +--
 fs/efivarfs/inode.c   | 3 +--
 fs/ext4/fast_commit.c | 3 +--
 fs/ext4/namei.c       | 3 +--
 fs/gfs2/super.c       | 3 +--
 fs/namei.c            | 3 +--
 8 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index 50bdd82682fa..edddd93d2118 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -3846,8 +3846,7 @@ struct inode *create_reloc_inode(struct btrfs_fs_info *fs_info,
 	btrfs_end_transaction(trans);
 	btrfs_btree_balance_dirty(fs_info);
 	if (err) {
-		if (inode)
-			iput(inode);
+		iput(inode);
 		inode = ERR_PTR(err);
 	}
 	return inode;
diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index 273998153fcc..c46696896f03 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -894,8 +894,7 @@ static noinline int replay_one_extent(struct btrfs_trans_handle *trans,
 	btrfs_update_inode_bytes(BTRFS_I(inode), nbytes, drop_args.bytes_found);
 	ret = btrfs_update_inode(trans, root, BTRFS_I(inode));
 out:
-	if (inode)
-		iput(inode);
+	iput(inode);
 	return ret;
 }
 
diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
index ce9b22aecfba..f952b50590e2 100644
--- a/fs/cifs/dir.c
+++ b/fs/cifs/dir.c
@@ -401,8 +401,7 @@ cifs_do_create(struct inode *inode, struct dentry *direntry, unsigned int xid,
 out_err:
 	if (server->ops->close)
 		server->ops->close(xid, tcon, fid);
-	if (newinode)
-		iput(newinode);
+	iput(newinode);
 	goto out;
 }
 
diff --git a/fs/efivarfs/inode.c b/fs/efivarfs/inode.c
index 939e5e242b98..ad2e5c63062a 100644
--- a/fs/efivarfs/inode.c
+++ b/fs/efivarfs/inode.c
@@ -119,8 +119,7 @@ static int efivarfs_create(struct user_namespace *mnt_userns, struct inode *dir,
 out:
 	if (err) {
 		kfree(var);
-		if (inode)
-			iput(inode);
+		iput(inode);
 	}
 	return err;
 }
diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index 3d72565ec6e8..e85d351a1a31 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -1659,8 +1659,7 @@ static int ext4_fc_replay_create(struct super_block *sb, struct ext4_fc_tl *tl,
 	set_nlink(inode, 1);
 	ext4_mark_inode_dirty(NULL, inode);
 out:
-	if (inode)
-		iput(inode);
+	iput(inode);
 	return ret;
 }
 
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index e37da8d5cd0c..2fd3b24a21cd 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -3363,8 +3363,7 @@ static int ext4_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	err = ext4_add_nondir(handle, dentry, &inode);
 	if (handle)
 		ext4_journal_stop(handle);
-	if (inode)
-		iput(inode);
+	iput(inode);
 	goto out_free_encrypted_link;
 
 err_drop_inode:
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 90db4a289269..a1d94013b96d 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1451,8 +1451,7 @@ extern void free_local_statfs_inodes(struct gfs2_sbd *sdp)
 	list_for_each_entry_safe(lsi, safe, &sdp->sd_sc_inodes_list, si_list) {
 		if (lsi->si_jid == sdp->sd_jdesc->jd_jid)
 			sdp->sd_sc_inode = NULL; /* belongs to this node */
-		if (lsi->si_sc_inode)
-			iput(lsi->si_sc_inode);
+		iput(lsi->si_sc_inode);
 		list_del(&lsi->si_list);
 		kfree(lsi);
 	}
diff --git a/fs/namei.c b/fs/namei.c
index 29414d1867fb..b1d93b2fc3b0 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4214,8 +4214,7 @@ int do_unlinkat(int dfd, struct filename *name)
 		dput(dentry);
 	}
 	inode_unlock(path.dentry->d_inode);
-	if (inode)
-		iput(inode);	/* truncate the inode here */
+	iput(inode);	/* truncate the inode here */
 	inode = NULL;
 	if (delegated_inode) {
 		error = break_deleg_wait(&delegated_inode);
-- 
2.25.1


