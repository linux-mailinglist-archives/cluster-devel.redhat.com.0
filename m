Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A34B6BF2D5
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Mar 2023 21:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679085690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mq9Fuoel6V0YUhHTTuzbIfCI3A8hDP0msftNsmf3Ou4=;
	b=B6YDTR0O763Kc2cvOLImXt1muPSPiMchSbotURWEanSE71D5Wr2804pXWVKNSOxONtMuYl
	UoCTwyg16ek2z/9y7q+VWBpJK4Ckq/n/Dv2ASmWFWswntRVAgJj6gXBl8/A6KxTH2Sw0ox
	j+ylkVZBAc7mr2SnFXJzt8jaTZOIliM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-VQmY9qsnMaq12kMr1b1zRA-1; Fri, 17 Mar 2023 16:41:26 -0400
X-MC-Unique: VQmY9qsnMaq12kMr1b1zRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6279C101A531;
	Fri, 17 Mar 2023 20:41:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58298417EC4;
	Fri, 17 Mar 2023 20:41:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EAD8A1946A4A;
	Fri, 17 Mar 2023 20:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF3181946A46 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A1CB1410F1C; Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F3441410F1B;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Mar 2023 16:40:59 -0400
Message-Id: <20230317204102.1776638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 0/3] dlm_controld: more plock fixes and
 cleanups
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

more patches of fixes and cleanups found by Andreas Gruenbacher.

Changes by me:

Added more cases when waiter struct is allocated by malloc() and
flags is not zeroed.

Thanks.

Andreas Gruenbacher (3):
  dlm_controld: initialize waiter->flags
  dlm_controld: get rid of unnecessary memset
  dlm_controld: remove unnecessary list_empty check

 dlm_controld/plock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.31.1

