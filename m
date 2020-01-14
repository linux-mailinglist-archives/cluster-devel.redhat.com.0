Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5D77213AFA0
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bajqoTfXNBhe603kthcB53WTXdoEQnn7EFCFq7W+UFU=;
	b=Rj6p8H9pvvZ1rrHbjco0+SnRGtLTYI2j8zre40sIAiywpg+bnBvXBXcjVd/g2xJo/OPUKS
	JZ2SlpJRPZvx0ZjRBQ1SH5yYZZfVTHb4d9ueE+QKSzNo4eLJRuI/+SAaFgaEvBcD/59AxT
	/8cLIGrYJjvSYFygBK0q/yEmzlZW/iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-POJ_8rtfPTutWUqCQEGWbA-1; Tue, 14 Jan 2020 11:40:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC0F8D985D;
	Tue, 14 Jan 2020 16:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98BD984320;
	Tue, 14 Jan 2020 16:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DEDE18089C8;
	Tue, 14 Jan 2020 16:40:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGeiS5021541 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96EC2874C9; Tue, 14 Jan 2020 16:40:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9266DB351D
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB0D010192B0
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-123-uK7YK27ANEeejj3r1aDMPA-1; Tue, 14 Jan 2020 11:40:39 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOnz-00008Y-Fj; Tue, 14 Jan 2020 16:12:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:16 +0100
Message-Id: <20200114161225.309792-4-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: uK7YK27ANEeejj3r1aDMPA-1
X-MC-Unique: POJ_8rtfPTutWUqCQEGWbA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGeiS5021541
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 03/12] xfs: fix IOCB_NOWAIT handling in
	xfs_file_dio_aio_read
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Direct I/O reads can also be used with RWF_NOWAIT & co.  Fix the inode
locking in xfs_file_dio_aio_read to take IOCB_NOWAIT into account.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index c93250108952..b8a4a3f29b36 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -187,7 +187,12 @@ xfs_file_dio_aio_read(
=20
 =09file_accessed(iocb->ki_filp);
=20
-=09xfs_ilock(ip, XFS_IOLOCK_SHARED);
+=09if (iocb->ki_flags & IOCB_NOWAIT) {
+=09=09if (!xfs_ilock_nowait(ip, XFS_IOLOCK_SHARED))
+=09=09=09return -EAGAIN;
+=09} else {
+=09=09xfs_ilock(ip, XFS_IOLOCK_SHARED);
+=09}
 =09ret =3D iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL,
 =09=09=09is_sync_kiocb(iocb));
 =09xfs_iunlock(ip, XFS_IOLOCK_SHARED);
--=20
2.24.1


