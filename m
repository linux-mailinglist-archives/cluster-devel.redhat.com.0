Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A1772F52
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 21:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691437248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V7VUV40AHb30+wl7s1L9oeo+r+o83Q0MloeOa8M3GeQ=;
	b=dfAjhgYzuhyT4NAeMPle0G8SvB85S1xcXLGq1kyBuz/aKWrAvbXw6kc3KG0txQ3EhfiEJ0
	0d01r+hDeaV4ZB4IkIFfLjljQhxfdVUELf3ufpQUip9LlafK0mXXkQzGvFUcf1EYWw41R3
	YLG3w7EGzAx9g9zr0Ybayn/oyFmhMBY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-6THQe3UPPMSx058hZ3mN1Q-1; Mon, 07 Aug 2023 15:40:43 -0400
X-MC-Unique: 6THQe3UPPMSx058hZ3mN1Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 947203811F32;
	Mon,  7 Aug 2023 19:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 865FC492C13;
	Mon,  7 Aug 2023 19:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DFC819465BC;
	Mon,  7 Aug 2023 19:40:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 36BAC194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 19:39:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B659440C7; Mon,  7 Aug 2023 19:39:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DF51759C
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:39:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FDB085CCE0
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:39:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-i2s2Ro3JPrCQ5ixbm7N_ZQ-1; Mon, 07 Aug 2023 15:39:34 -0400
X-MC-Unique: i2s2Ro3JPrCQ5ixbm7N_ZQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E0CF621C0;
 Mon,  7 Aug 2023 19:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E95C433AD;
 Mon,  7 Aug 2023 19:39:26 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:38 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=BbICkmDBBgSwVYXS6EZd0IrAvg6Sna2OcPY/ygsvt9A=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+aVcwKVBDp9E8rOPtssDQbh7IcGxvS0rwI
 c1S2hBt9TuJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 FSPAEACPlCK3EgTnJat9G2lrCllZiR9HeXocxcWOoiDdqnOhA+LCdHCG7FPdv/tU6u5WnxoUH7B
 ARY5BR/8sjxizcFksE2rWBMWCvo/lCt3fEvv/TumLj+HamcwMPPGMuPB/bHhgM4O53ozb4mxyXc
 lBk42qVLhXQ3MpJKcdrAWqVbo5LnY8ffNoMTI9BljHoAWIZZA/FjxrWUD10PTuyI/p95JNSIDCB
 6MjkGDIc9Aa41sfJVYJIe8fYFiGCsBhIgJwOYv44zu1wI4AJx5ZynU4UbweZHqkp2dc8U17oDEG
 8MZvUycGi4MbEufJuFsQMH4rn7w9ETKsguIBXgoT/zt3aRI/dhj4ZBfQcMCgJXkbBEqz0K2cQx9
 tUWV8oyU96vyxSzufIbhSczkroS2v5Uk9TpTq21U2Q3/lLA0Kh02dmR+sN5DgRGjgs8PcsIyumE
 D+5GYVvwgcyhHgdLN2ZLUDDOYzxGk0zl8gn1BuXb0iVHMlEjajc701wdqK191Yz1E8OOA8mx5Gz
 /ZWTo657yfwR4rLHHNlU2jA2S3EjuD9deqANKCDsth+oSL7VOVcmdG+vA7CwskS2JFW3KISHb/o
 EVZxdxxPBB7VOEROYbHIE4wJsXavHzD/Z9/+n6qkWcPntfHcdKgrVLfDRkHmM7z3U4pO5Pssc3p
 xOm62tN6CQuYYsQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v7 07/13] xfs: have xfs_vn_update_time gets
 its own timestamp
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In later patches we're going to drop the "now" parameter from the
update_time operation. Prepare XFS for this by reworking how it fetches
timestamps and sets them in the inode. Ensure that we update the ctime
even if only S_MTIME is set.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/xfs_iops.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 731f45391baa..72d18e7840f5 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1037,6 +1037,7 @@ xfs_vn_update_time(
 	int			log_flags = XFS_ILOG_TIMESTAMP;
 	struct xfs_trans	*tp;
 	int			error;
+	struct timespec64	now = current_time(inode);
 
 	trace_xfs_update_time(ip);
 
@@ -1056,12 +1057,15 @@ xfs_vn_update_time(
 		return error;
 
 	xfs_ilock(ip, XFS_ILOCK_EXCL);
-	if (flags & S_CTIME)
-		inode_set_ctime_to_ts(inode, *now);
+	if (flags & (S_CTIME|S_MTIME))
+		now = inode_set_ctime_current(inode);
+	else
+		now = current_time(inode);
+
 	if (flags & S_MTIME)
-		inode->i_mtime = *now;
+		inode->i_mtime = now;
 	if (flags & S_ATIME)
-		inode->i_atime = *now;
+		inode->i_atime = now;
 
 	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
 	xfs_trans_log_inode(tp, ip, log_flags);

-- 
2.41.0

