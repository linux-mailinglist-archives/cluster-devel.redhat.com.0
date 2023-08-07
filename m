Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FB772F55
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 21:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691437249;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MKgBp9oK9I/eGiA5ZFHpYsdGcuADtbCd2AXbZ6/hxtU=;
	b=eIXM0H1RAXk4vWdLpZ+JygmuO92xSjD7QZQWVYIl9BFQhMCQ+kh33yUC09ck7p+fIJLZIy
	oNVSTPdocnXzX4jQ/fwd06bYaga+0udFjAfTCdyvGeic2AaM1H0wo0Rq+kAeW5AWELhEz/
	jM53LXa32JXl9hifsoOOirj5I/tuNys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-1Y5f-lhcO-CdGiQCOfq65Q-1; Mon, 07 Aug 2023 15:40:43 -0400
X-MC-Unique: 1Y5f-lhcO-CdGiQCOfq65Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34200185A7A8;
	Mon,  7 Aug 2023 19:40:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2855C15BAD;
	Mon,  7 Aug 2023 19:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DF3F19465B8;
	Mon,  7 Aug 2023 19:40:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 38D701946594 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 19:39:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F8E42166B27; Mon,  7 Aug 2023 19:39:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 361692166B25
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:39:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19CB31C05158
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:39:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-k4YU14YDOM-HzOrzePdtoA-1; Mon, 07 Aug 2023 15:39:21 -0400
X-MC-Unique: k4YU14YDOM-HzOrzePdtoA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC37D621D9;
 Mon,  7 Aug 2023 19:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F53C0760F;
 Mon,  7 Aug 2023 19:39:12 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:36 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=w/lSN0ukwva6epMNoVXoGECLFjjw4G/9PpuKUglAlXI=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9pI0NrLPqkw/IVc72gm+1CKA4xq0qrZy8b
 uVUq7nnyrmJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 Fa9OEACCVBv40jfSNekICILFILSv3kfMvSgBhgjGx95YgjXppdwzEyLLlwpSVrSsRV+cftyGpIm
 fAE/yx7Tg45YQHPEAIjZsXv7bmnKzSjeE6SBYRlzajEuRP5jYccKnpHBkFgt3Bm6CzwTXKsc+wP
 P+Os6/rMfvLYhgIRrsw2TynaKTK+KCmkPhLl2MY80nE/IJJDuKyc12CA3WObaND9DMiDvrpFrVy
 +EpTXRHLFTVw9XhkfotB2MTddGG22XE2bX61v2EY7jVHsLfvCexOUHqHERkOMf7sNYTYBNGbQWj
 GDOTlMmoFkepJxCRNTmBrGPvaEWotzG/J/olLjLSwazaPHviKqV6+YswMlUDwNSkpe3Vj9wVLz4
 2q00zgOWKIlzdWwn+HfMColQvMyebLbvGGAipQSNWb31zah3OmKeUULR8PVuszN88ZNHeezNxXA
 hvZpmJoX1eJLN7m8v8Ed43X/VhazgHgNvOCNu7abZkmYVfTwgI40o7Bd9RLXq+64YqOP+YK+z3Q
 Zq+YbwZYcxNUuUpn+Cgp7YHZUbEsahymP2YrmwqP4Xob7knCd5llIT+NhSveXB+ZQWC6fDyX7Ch
 VbhvDGsvPZ+SUd/2o3PDvfQrzxcr0zoGj7FQvhSljVPTCnHDYuqdBgwJjRAwav0+7Gr4YtL69lE
 MReVPilZbhz9ThA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v7 05/13] fat: make fat_update_time get its
 own timestamp
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In later patches, we're going to drop the "now" parameter from the
update_time operation. Fix fat_update_time to fetch its own timestamp.
It turns out that this is easily done by just passing a NULL timestamp
pointer to fat_update_time.

Also, it may be that things have changed by the time we get to calling
fat_update_time after checking inode_needs_update_time. Ensure that we
attempt the i_version bump if any of the S_* flags besides S_ATIME are
set.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 67006ea08db6..8cab87145d63 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -347,14 +347,14 @@ int fat_update_time(struct inode *inode, struct timespec64 *now, int flags)
 		return 0;
 
 	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
-		fat_truncate_time(inode, now, flags);
+		fat_truncate_time(inode, NULL, flags);
 		if (inode->i_sb->s_flags & SB_LAZYTIME)
 			dirty_flags |= I_DIRTY_TIME;
 		else
 			dirty_flags |= I_DIRTY_SYNC;
 	}
 
-	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
 		dirty_flags |= I_DIRTY_SYNC;
 
 	__mark_inode_dirty(inode, dirty_flags);

-- 
2.41.0

