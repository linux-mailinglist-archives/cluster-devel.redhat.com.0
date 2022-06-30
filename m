Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D5561CA5
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 16:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656597647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LxaOFylJkQ/MdwV5aA3pa1YtRMsbn1Q4ucnowsYMktM=;
	b=bVd9qz4QK2qhrj2JxaqQwiYhylq+xB/uXDL+/1sdSuEwIpj5tNFhb2k+IK2h4RmdlAv6cx
	vvyY7mCG6icvv/2MBiEF7qIjC1oWcQUZ5N0KeQ/MQdzqgLrC7H7XUBhcH4V7NIT7wu0L59
	bM7e44+LvmmRuT2+UR6AjWALdV8+ZfU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-prcvUU3DMGamh5pr0ivGuw-1; Thu, 30 Jun 2022 10:00:34 -0400
X-MC-Unique: prcvUU3DMGamh5pr0ivGuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7BB3826A62;
	Thu, 30 Jun 2022 13:59:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8CC11415111;
	Thu, 30 Jun 2022 13:59:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7BFC51947064;
	Thu, 30 Jun 2022 13:59:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9995A194704E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Jun 2022 13:59:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88F1D1730C; Thu, 30 Jun 2022 13:59:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D18018EAD;
 Thu, 30 Jun 2022 13:59:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: will@kernel.org
Date: Thu, 30 Jun 2022 09:59:32 -0400
Message-Id: <20220630135934.1799248-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [RFC 0/2] refcount: attempt to avoid imbalance
 warnings
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
Cc: mark.rutland@arm.com, peterz@infradead.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-sparse@vger.kernel.org, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, luc.vanoostenryck@gmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

This patch tries to avoid some sparse warnings related to
refcount_dec_and_lock() and kref_put_lock().

I send this patch series as RFC because it was necessary to do a kref
change after adding __cond_lock() to refcount_dec_and_lock()
functionality.

For me it looks like we do a lot of acrobatics to avoid sparse warnings
here and I really don't know if it's worth the offer. However this is
what I have now...

- Alex

Alexander Aring (2):
  refcount: add __cond_lock() for conditional lock refcount API
  kref: move kref_put_lock() callback to caller

 include/linux/kref.h     | 24 ++++++++----------------
 include/linux/refcount.h | 21 ++++++++++++++++-----
 lib/refcount.c           | 23 ++++++++++++-----------
 3 files changed, 36 insertions(+), 32 deletions(-)

-- 
2.31.1

