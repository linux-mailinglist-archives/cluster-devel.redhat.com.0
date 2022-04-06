Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0A4F688F
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 20:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649268347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fYfpLFvTezX4xOeqJ0ibWE0UJQGUFijwEE190NqJWh4=;
	b=UCidWHE4gHisAueRvThfPNTI9T+10u7EtJrVt9tLGqCtYerHy1a+VMNOEgXKXm3NbKD+Ut
	nMw7onwnaChYl797Uf+lZoDosBv2e9CINrB9bJJ8tblIbWzOU9cywPFQeVxFh3PyprQXnF
	DOJJtkQMeHBYZTgQHiuSFH+Htkh4GC8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-YWOKzWJrNmm-JdfU6ycd8w-1; Wed, 06 Apr 2022 14:05:42 -0400
X-MC-Unique: YWOKzWJrNmm-JdfU6ycd8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B58899EC1;
	Wed,  6 Apr 2022 18:05:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B72240CF914;
	Wed,  6 Apr 2022 18:05:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C6E7194036B;
	Wed,  6 Apr 2022 18:05:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA6BC1949763 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 18:05:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C8D691121330; Wed,  6 Apr 2022 18:05:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98B801121314;
 Wed,  6 Apr 2022 18:05:34 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  6 Apr 2022 14:05:29 -0400
Message-Id: <20220406180531.3886002-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH RESEND dlm/next 0/2] dlm: resend list
 iterator patches
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
Cc: cluster-devel@redhat.com, jakobkoschel@gmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this is a resend of Jakob Koschels list iterator patches rebased on
current pending dlm patches. We had a lot of change in the plock
handling of dlm.

*little change that lkb is named "big_lkb" to remain the "big lock"
information in variable name of function recover_lvb(). Otherwise it
should be the same.

Thanks.

- Alex

Jakob Koschel (2):
  dlm: remove usage of list iterator for list_add() after the loop body
  dlm: replace usage of found with dedicated list iterator variable

 fs/dlm/lock.c    | 65 ++++++++++++++++++++++++------------------------
 fs/dlm/plock.c   | 24 +++++++++---------
 fs/dlm/recover.c | 39 ++++++++++++++---------------
 3 files changed, 64 insertions(+), 64 deletions(-)

-- 
2.31.1

