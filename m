Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6312D13AF96
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y46inmX0jxbQUH3icxTxCs2afpb/kZc/VpYEcfoOKlE=;
	b=Mp5tkM4nOrygHxmFwkfkUK7zov9OKCDvcHhEmF+V5ZZuWv9d5bZEH/gBD5KIPgYEBEw6fA
	Ecy1mVj5JvvUIBzbXSJNWklj8VI+lEMW4u1m5RDfb6ikO+BB1KcqWffuyuNygs6y8KEBdP
	FfIqCXne0KYJ33HdCzlH7WdtSs6nDKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-v86uuxswObS6Nlcopojqgg-1; Tue, 14 Jan 2020 11:40:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C716B18A6EEF;
	Tue, 14 Jan 2020 16:40:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A475C1D6;
	Tue, 14 Jan 2020 16:40:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A9A582514;
	Tue, 14 Jan 2020 16:40:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGe7WC021440 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44B5F10AF41C; Tue, 14 Jan 2020 16:40:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 402D110AF419
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA6710192AB
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-385-xy2BorMKMWGzAJWEQlWwOA-1; Tue, 14 Jan 2020 11:40:01 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOoO-0000GP-6P; Tue, 14 Jan 2020 16:13:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:25 +0100
Message-Id: <20200114161225.309792-13-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: xy2BorMKMWGzAJWEQlWwOA-1
X-MC-Unique: v86uuxswObS6Nlcopojqgg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGe7WC021440
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 12/12] iomap: remove the inode_dio_begin/end
	calls
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Now that all iomap users hold i_rwsem over asynchronous I/O
operations these calls can be removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/direct-io.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 0113ac33b0a0..c90ec82e8e08 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -126,7 +126,6 @@ static ssize_t iomap_dio_complete(struct iomap_dio *dio=
, bool unlock)
 =09if (ret > 0 && (dio->flags & IOMAP_DIO_NEED_SYNC))
 =09=09ret =3D generic_write_sync(iocb, ret);
=20
-=09inode_dio_end(file_inode(iocb->ki_filp));
 =09kfree(dio);
=20
 =09return ret;
@@ -513,8 +512,6 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 =09=09=09goto out_free_dio;
 =09}
=20
-=09inode_dio_begin(inode);
-
 =09blk_start_plug(&plug);
 =09do {
 =09=09ret =3D iomap_apply(inode, pos, count, flags, ops, dio,
--=20
2.24.1


