Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1C772F42
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 21:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691437230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YCxRPDoHc5l28ZF0D9WR73zHxvxBQdZMPOGpKFcm9WA=;
	b=HzJ0huTV7aOI+ODpPC4sXZYBy8qHC3qyBgvf7rxHV0cW996cS1wtSQMVfQgNQns6BB6HAY
	lvcOLINZ9dEzxKMtxt+mesxEKsMpGzo+F1vaf8d71XeyggTvUVYkvXGKdVmmOLfoKLpofw
	XT/D4rIH5U/yqtvmJZksF20JGIUyKOU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-eBdgJBaUNQOqW_JSPGL3Qg-1; Mon, 07 Aug 2023 15:40:27 -0400
X-MC-Unique: eBdgJBaUNQOqW_JSPGL3Qg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A6F3C0DDB1;
	Mon,  7 Aug 2023 19:40:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8094021B9;
	Mon,  7 Aug 2023 19:40:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EDE0A19465A8;
	Mon,  7 Aug 2023 19:40:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 185DF1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 19:39:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA02140D283D; Mon,  7 Aug 2023 19:39:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D29A640D2839
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B70B6280FEC1
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:39:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-GCgURPWeOuKxwHkkBMQsAw-1; Mon, 07 Aug 2023 15:39:27 -0400
X-MC-Unique: GCgURPWeOuKxwHkkBMQsAw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69C9A621DA;
 Mon,  7 Aug 2023 19:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BFCC433AB;
 Mon,  7 Aug 2023 19:39:19 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:37 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-6-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=GbRbPLOxHLvc3DeuudVIv0R96Xl/KQh1gZUkLNJwaqw=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9wCd8uHf1JTgjFwTpewg5ScLm1k4tTu02Y
 EC0/mG6MoaJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 Fct1EACdouI5B+JSe5rResZvzr2jp0vI9jztehgsnHaGwZpffA5C0T8Yg38sCZ7YdqkMrSalPu3
 w5M7Xcnqdsh4N6Piv9FyxKwRSFhd6L5ltVRVHih3Qrw4CyeqQSC7cF/EoGpJa9WWyMiMRBCPwXS
 SU4LxtVbYmpo45fMxJtALEzmwSMTQIvU1bzpRV4xXlicR54RmnWjkO1z9jdwOxQ6twX9yCYJWhy
 +3XrcrBrTeCS8Z8HreMQGrXDkWsGpGOLe30hRm2zRRGLDwDg58GheX7tI3FJuoWyyPSnXy3GZc3
 IA0WXjumJsnEmtP0TTId+6zh00veQZd5f1GR1l36s9K0aaYaoM1mZs2JdqnG9u0fTI7XR41ftea
 t8+T7wkMIFECd37uaZbjycDqk1RHCXJ9ICgFsL1nEAdkbZL+3Amxg7YLPni5Idxrzm1T01riCL8
 urj0TVjv0LL8Cu70DTcMmlGNYW6HA78KZAiTzBDyB1/8z1iYpiO1fv++ontB2RmfNWnf88B+/uB
 dUK97a5CoO8W1Sg3FRMI1RzkPuF6rcuqwIopnsbtQLtxWCgvC+TTGMRmkaMSjYLODUCN/px7EYj
 1m1keuzLArUPtUidWiCLHEoBgRNimTN+hBNrZNS9Ycr9H0FD7wiIc3WUf0F2tZ/Zb1UbnIJDvl2
 CuiXxVzCtmQDRgA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v7 06/13] ubifs: have ubifs_update_time use
 inode_update_timestamps
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In later patches, we're going to drop the "now" parameter from the
update_time operation. Prepare ubifs for this, by having it use the new
inode_update_timestamps helper.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ubifs/file.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index df9086b19cd0..2d0178922e19 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1397,15 +1397,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 		return err;
 
 	mutex_lock(&ui->ui_mutex);
-	if (flags & S_ATIME)
-		inode->i_atime = *time;
-	if (flags & S_CTIME)
-		inode_set_ctime_to_ts(inode, *time);
-	if (flags & S_MTIME)
-		inode->i_mtime = *time;
-
-	release = ui->dirty;
+	inode_update_timestamps(inode, flags);
 	__mark_inode_dirty(inode, I_DIRTY_SYNC);
+	release = ui->dirty;
 	mutex_unlock(&ui->ui_mutex);
 	if (release)
 		ubifs_release_budget(c, &req);

-- 
2.41.0

