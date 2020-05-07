Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 65DC51C9D56
	for <lists+cluster-devel@lfdr.de>; Thu,  7 May 2020 23:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588887328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tvuO4d1pqU7a1MoMllCmlxnT+iUUu6oWmDHwUbzqBrc=;
	b=JrV/drkZ/AKdLslh3oBlj24FJb0dGy1j4j595tqFxNRuLehQCIbFUD81MNcWzsnz+KanjF
	McPNOeD169tgeyZZT4U1aKMhHnwKf/EztiHPbh/uZtzwGU6nAXvdFIihj28joBRZ/+Wgnq
	2F4JtBvtzfc/iBQI+mLziedGewFLF6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-CkhApaItPmyGDsOfLfOl_w-1; Thu, 07 May 2020 17:35:26 -0400
X-MC-Unique: CkhApaItPmyGDsOfLfOl_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8EE3835B41;
	Thu,  7 May 2020 21:35:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F3B2BFF9;
	Thu,  7 May 2020 21:35:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F2FF4CAA0;
	Thu,  7 May 2020 21:35:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047LZFxn026790 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 17:35:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 093A72026DFD; Thu,  7 May 2020 21:35:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A462026971
	for <cluster-devel@redhat.com>; Thu,  7 May 2020 21:35:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95E1580028B
	for <cluster-devel@redhat.com>; Thu,  7 May 2020 21:35:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-87-Yzkaet8VNYWbdC12jzQaZw-1; Thu, 07 May 2020 17:35:08 -0400
X-MC-Unique: Yzkaet8VNYWbdC12jzQaZw-1
Received: from localhost.localdomain ([149.172.19.189]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPA
	(Nemesis) id
	1M2fDl-1jYidz2tHb-004D2T; Thu, 07 May 2020 23:34:40 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>,
	Steve Whitehouse <swhiteho@redhat.com>
Date: Thu,  7 May 2020 23:34:28 +0200
Message-Id: <20200507213438.1886005-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MWsD4C2gbHQCzPSYpVZ0sRh+EhEaHN4oMDZVkk1sis4OPLEClxS
	9xPRJqaQrjFl8IZ2Wv+Imy6LKHFafuWPi7xy8fl6ubV2+zFiAgJ6IxDiVxaK4716fxwdvqh
	M5rEYTS93N64nWAN6gDJVXmzdZYNsNmMvQlR/FTzVXrvI8h/2iIzH/7IgDXLXgUGItn6TXu
	GD9+FlIaYKZw9eXdw7bPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zlN+6/l7oGM=:Dtq4zd5iUWJg9Z78qsfioZ
	8RK3MHA0rTEYRPIyN7utMpOZAgFAhbZRr2wZmJ6rZD7wYBQeVP6lJjJYNP0Y4pA8ziyluG+OA
	0emP49TXl7VaRidDwOBf3AIz1rvtgUEUmlqDcx7VPKsC49CK2ZxZq9BQYMIN9lKnSIPCe72y6
	LamOjF/74tCb2buLKP/rHpDHeatvFoo9xLhujqR7Nf2OyzkMsOdKLv/UfsDOTQGPuJJdVL+Bb
	punQYzmOEevxUCFpxvXnGSnKpqP6L8Z4S5riXlgoNOPgH/EegygOfE2jwHXlT7K2Noa+evqJ/
	TQn71PQJM5umwRSI+Df7ztizmEMrmNpbfSAQEjIxhNq42CeSWmWA1VI9uXMnguoveazaJ4aYT
	qFonyxDdXAdZkeYS3j3WLQZbUjNf9Pr71lF4fRkTLUvBM/qisoljjIa5TCb6hYEp1zjy/93rZ
	feBlVofAdNBshcUd3Z5/DLhZ0xJ8T3Pn+e2LBbv9xvv0aNTOx/7OVp/SFkosOQw12GOvCaN59
	8Lo6dSS+pK2H61RZulEtmOm6AItFAZKtPWi0OowNBIm13PffuCKmNhiD0aZt9Urdz7oPmRmAy
	t2PubAtayKfOzzrQjMLDVkZ9PzcMX1CohkcyKWJYuZ81BL3ajX5rnaIjlXyOuYo0IU7MERGhl
	dE+XXVaHj2cVQCMdASZIfIrWy7xM49XBBn4igMM96xL8ai9SJ0Rn1yS055OHKCBzc2AiP8nsG
	krVjtRPYFE/MBMvZeMC+tBjymko3ZImGZv/Rrn8kGdIuJUFFzEe8UpdekyHRZpbgZURXtsNKm
	fkZkKttRwrfOHBxEfx593W9WShzlz+bMYciYGVzrKlPqxjMlI8=
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047LZFxn026790
X-loop: cluster-devel@redhat.com
Cc: Arnd Bergmann <arnd@arndb.de>, Alexios Zavras <alexios.zavras@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	clang-built-linux@googlegroups.com, Richard Fontana <rfontana@redhat.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [Cluster-devel] [PATCH] dlm: remove BUG() before panic()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Building a kernel with clang sometimes fails with an objtool error in dlm:

fs/dlm/lock.o: warning: objtool: revert_lock_pc()+0xbd: can't find jump des=
t instruction at .text+0xd7fc

The problem is that BUG() never returns and the compiler knows
that anything after it is unreachable, however the panic still
emits some code that does not get fully eliminated.

Having both BUG() and panic() is really pointless as the BUG()
kills the current process and the subsequent panic() never hits.
In most cases, we probably don't really want either and should
replace the DLM_ASSERT() statements with WARN_ON(), as has
been done for some of them.

Remove the BUG() here so the user at least sees the panic message
and we can reliably build randconfig kernels.

Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/dlm/dlm_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 416d9de35679..4311d01b02a8 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -97,7 +97,6 @@ do { \
                __LINE__, __FILE__, #x, jiffies); \
     {do} \
     printk("\n"); \
-    BUG(); \
     panic("DLM:  Record message above and reboot.\n"); \
   } \
 }
--=20
2.26.0


