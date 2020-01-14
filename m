Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2AF13AF97
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9u+diChHTMKgviTDqiLyT+MfuaKuyYJ8rFdi2yrBUhs=;
	b=UkoQ8NjpEdRinzTlKglGY+wBgu9gOZdcD+PoF7hIi6LXVLlIdF6WYwyt56uBWWUxu+3w8d
	ChfSUD4xPtE/QC86StqGPMfUYmy/py6p6Yh4oVt+fLZ6fsAZgE6YDhmjjMpWg/5tSVRdn7
	5PB+TK1LWa1pPDe9jg5jEy9vDZwKBQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-_rlM1IKUM-GjD-v-ARjrXQ-1; Tue, 14 Jan 2020 11:40:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89528F9B6A;
	Tue, 14 Jan 2020 16:40:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2541842B6;
	Tue, 14 Jan 2020 16:40:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60F5018089CD;
	Tue, 14 Jan 2020 16:40:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGe2nu021424 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50067215AB04; Tue, 14 Jan 2020 16:40:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B5902026D67
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48598185AB87
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-mP24T2bcMlyYo0MRirx9hg-1; Tue, 14 Jan 2020 11:39:56 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOnw-00007u-QN; Tue, 14 Jan 2020 16:12:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:15 +0100
Message-Id: <20200114161225.309792-3-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: mP24T2bcMlyYo0MRirx9hg-1
X-MC-Unique: _rlM1IKUM-GjD-v-ARjrXQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGe2nu021424
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 02/12] locking/rwsem: Exit early when held
	by an anonymous owner
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

The rwsem code overloads the owner field with either a task struct or
negative magic numbers.  Add a quick hack to catch these negative
values early on.  Without this spinning on a writer that replaced the
owner with RWSEM_OWNER_UNKNOWN, rwsem_spin_on_owner can crash while
deferencing the task_struct ->on_cpu field of a -8 value.

XXX: This might be a bit of a hack as the code otherwise doesn't use
the ERR_PTR family macros, better suggestions welcome.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/locking/rwsem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 44e68761f432..6adc719a30a1 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -725,6 +725,8 @@ rwsem_spin_on_owner(struct rw_semaphore *sem, unsigned =
long nonspinnable)
 =09state =3D rwsem_owner_state(owner, flags, nonspinnable);
 =09if (state !=3D OWNER_WRITER)
 =09=09return state;
+=09if (IS_ERR(owner))
+=09=09return state;
=20
 =09rcu_read_lock();
 =09for (;;) {
--=20
2.24.1


