Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2378C07B
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K1DrU1qkyUMsVVrJ8YG4mbowDOIiXf8iEmJ76ejgwo4=;
	b=jPdo+E4cdgxoBrmiLwJbdCLQd3LQTM2JtY9cFT8T/oQrzqkRUpirScbcEQVHh7HmSVFSsq
	059I+t7fneeBDNuXWBxAxhiLHpueRFkg8807LxqJdCZ/fCxIPpM95kmVgGkJg/To+lP1Db
	lAj72T8QKR+0flQx4iE7J9BUJQA/ItU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-4Y-GTPi0NCeNNo2nyknCJA-1; Tue, 29 Aug 2023 04:41:10 -0400
X-MC-Unique: 4Y-GTPi0NCeNNo2nyknCJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B0D1C29AEA;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF5F840C6F4C;
	Tue, 29 Aug 2023 08:41:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 30A6719465BD;
	Tue, 29 Aug 2023 08:41:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A28E19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:05:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA76C2166B29; Fri, 25 Aug 2023 14:05:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1A052166B27
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:05:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5CFB10A5CDA
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:05:08 +0000 (UTC)
Received: from out-249.mta1.migadu.com (out-249.mta1.migadu.com
 [95.215.58.249]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-CZTwmq7VNla6SSq77mz38A-1; Fri, 25 Aug 2023 10:05:06 -0400
X-MC-Unique: CZTwmq7VNla6SSq77mz38A-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:26 +0800
Message-Id: <20230825135431.1317785-25-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 24/29] xfs: support nowait for
 xfs_buf_read_map()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

This causes xfstests generic/232 hung in umount process, waiting for ail
push, so I comment it for now, need some hints from xfs folks.
Not a real patch.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index cdad80e1ae25..284962a9f31a 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -828,6 +828,13 @@ xfs_buf_read_map(
 =09trace_xfs_buf_read(bp, flags, _RET_IP_);
=20
 =09if (!(bp->b_flags & XBF_DONE)) {
+//=09=09/*
+//=09=09 * Let's bypass the _xfs_buf_read() for now
+//=09=09 */
+//=09=09if (flags & XBF_NOWAIT) {
+//=09=09=09xfs_buf_relse(bp);
+//=09=09=09return -EAGAIN;
+//=09=09}
 =09=09/* Initiate the buffer read and wait. */
 =09=09XFS_STATS_INC(target->bt_mount, xb_get_read);
 =09=09bp->b_ops =3D ops;
--=20
2.25.1

