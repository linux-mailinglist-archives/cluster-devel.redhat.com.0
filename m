Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 599B178C0A4
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UwSjPjmuy1jc27+t764F70lOVxptVjygEg6OOed63p8=;
	b=W5WfoQp3MHLCK9vdNDqflszx4hD0A4hhkrFHD5rB2LhKIRvDwKxQ8fHRPlUr2arf51VLac
	rF0wNSdkQNQYWWJ1kdHFRiJku3cZaPyIF/fc9ohhJXYTnssJnXlM6BMP8LCcOCVO1A71ex
	5H67ToJE0kVK4/NealWXaL/NPE4g69Y=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-SOBUGo10OuyGaLYnNDTfGw-1; Tue, 29 Aug 2023 04:41:13 -0400
X-MC-Unique: SOBUGo10OuyGaLYnNDTfGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5592B3C100BE;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 442D8140E962;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00A401946A62;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4867119465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:03:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 095B32166B27; Fri, 25 Aug 2023 14:03:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01ABC2166B26
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9DCA185A792
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:03:52 +0000 (UTC)
Received: from out-244.mta1.migadu.com (out-244.mta1.migadu.com
 [95.215.58.244]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-wPzSbEOdMYGXnmGP05W6Hw-1; Fri, 25 Aug 2023 10:03:50 -0400
X-MC-Unique: wPzSbEOdMYGXnmGP05W6Hw-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:23 +0800
Message-Id: <20230825135431.1317785-22-hao.xu@linux.dev>
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
Subject: [Cluster-devel] [PATCH 21/29] xfs: return -EAGAIN when bulk memory
 allocation fails in nowait case
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Rather than wait for a moment and retry, we return -EAGAIN when we fail
to allocate bulk memory in xfs_buf_alloc_pages() in nowait case.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index a6e6e64ff940..eb3cd7702545 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -404,6 +404,11 @@ xfs_buf_alloc_pages(
 =09=09if (filled !=3D last)
 =09=09=09continue;
=20
+=09=09if (nowait) {
+=09=09=09xfs_buf_free_pages(bp);
+=09=09=09return -EAGAIN;
+=09=09}
+
 =09=09if (flags & XBF_READ_AHEAD) {
 =09=09=09xfs_buf_free_pages(bp);
 =09=09=09return -ENOMEM;
--=20
2.25.1

