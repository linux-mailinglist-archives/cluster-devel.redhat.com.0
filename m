Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D984F820C
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 16:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649342755;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pSZSA1+PlH/7OKs2PFLaqRHsJzk4RCBZq1QS/GPAw6A=;
	b=dygexTdGtAk1emAH4gfkVDeG1MiG4hSWyqK+G6faFaCzlOXISxxDj8I9J4H/orBK82StmJ
	pkBNBAFRUJOQ5hKDC+MRVGP0HNRxm8yIkHuPqL+cM+tA7eU01TVUAyvKk/LctPnBwPQQKg
	1SBND1cxe9rVqR/ZEHuuhqTV5LmaXFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-J4vP1j3CMjKCRh-DpjpqfQ-1; Thu, 07 Apr 2022 10:45:49 -0400
X-MC-Unique: J4vP1j3CMjKCRh-DpjpqfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08CAE801E95;
	Thu,  7 Apr 2022 14:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 401EF40D2848;
	Thu,  7 Apr 2022 14:45:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 039221940340;
	Thu,  7 Apr 2022 14:45:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 484A11947BBE for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 14:45:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2829B1400E74; Thu,  7 Apr 2022 14:45:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08FCF141512B;
 Thu,  7 Apr 2022 14:45:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  7 Apr 2022 10:45:42 -0400
Message-Id: <20220407144542.1369833-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: cast resource pointer to
 uintptr_t
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes the following warning when doing a 32 bit kernel build
when pointers are 4 byte long:

In file included from ./include/linux/byteorder/little_endian.h:5,
                 from ./arch/x86/include/uapi/asm/byteorder.h:5,
                 from ./include/asm-generic/qrwlock_types.h:6,
                 from ./arch/x86/include/asm/spinlock_types.h:7,
                 from ./include/linux/spinlock_types_raw.h:7,
                 from ./include/linux/ratelimit_types.h:7,
                 from ./include/linux/printk.h:10,
                 from ./include/asm-generic/bug.h:22,
                 from ./arch/x86/include/asm/bug.h:87,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from ./include/linux/slab.h:15,
                 from fs/dlm/dlm_internal.h:19,
                 from fs/dlm/rcom.c:12:
fs/dlm/rcom.c: In function ‘dlm_send_rcom_lock’:
./include/uapi/linux/byteorder/little_endian.h:32:43: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
                                           ^
./include/linux/byteorder/generic.h:86:21: note: in expansion of macro ‘__cpu_to_le64’
 #define cpu_to_le64 __cpu_to_le64
                     ^~~~~~~~~~~~~
fs/dlm/rcom.c:457:14: note: in expansion of macro ‘cpu_to_le64’
  rc->rc_id = cpu_to_le64(r);

The rc_id value in dlm rcom is handled as u64. The rcom implementation
uses for an unique number generation the pointer value of the used
dlm_rsb instance. However if the pointer value is 4 bytes long
-Wpointer-to-int-cast will print a warning. We get rid of that warning
to cast the pointer to uintptr_t which is either 4 or 8 bytes. There
might be a very unlikely case where this number isn't unique anymore if
using dlm in a mixed cluster of nodes and sizeof(uintptr_t) returns 4 and
8.

However this problem was already been there and this patch should get
rid of the warning.

Fixes: 2f9dbeda8dc0 ("dlm: use __le types for rcom messages")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/rcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index a73464bccda7..f19860315043 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -454,7 +454,7 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 
 	rl = (struct rcom_lock *) rc->rc_buf;
 	pack_rcom_lock(r, lkb, rl);
-	rc->rc_id = cpu_to_le64(r);
+	rc->rc_id = cpu_to_le64((uintptr_t)r);
 
 	send_rcom(mh, rc);
  out:
-- 
2.31.1

