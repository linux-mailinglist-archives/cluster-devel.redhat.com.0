Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6995804DE
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Jul 2022 21:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658778814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SJQhmqiMZBrx3tTfrS58fU8YO/57ZJ5gxxWDAo642mA=;
	b=WvgtT3WzyFJT8Z2e6C2KsB502hIKFlF3Cwa7NSWQQGPRPJtnv36FA/TU4zuidPcynOq6pn
	Y4mdZxHqb4Hi3ZjcEYPbfRDTzAA+TJjo/wjiYpxJpBO1NyDkZPT+JQDN90KPPYNnMJW+aT
	cRawjjjGBAgDkj/E8TGzI636yeQ/ce0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-N-8a0HlvN3WNXm2OfL51YQ-1; Mon, 25 Jul 2022 15:53:28 -0400
X-MC-Unique: N-8a0HlvN3WNXm2OfL51YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94FC380452A;
	Mon, 25 Jul 2022 19:53:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70163403D0D9;
	Mon, 25 Jul 2022 19:53:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 266AD1945D89;
	Mon, 25 Jul 2022 19:53:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A422B1945D86 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 19:53:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C7E92026D2D; Mon, 25 Jul 2022 19:53:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 162B92026D07;
 Mon, 25 Jul 2022 19:53:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 25 Jul 2022 15:53:20 -0400
Message-Id: <20220725195322.857226-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv2 dlm/next 0/2] fs: dlm: some callback and
 lowcomm fixes
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

I currently look a little bit deeper into the callback handling of dlm.
I have some local branches which does more some rework and moving away
from the lkb_callbacks[] array per lkb and using a queue for handling
callbacks. However those are issues which I currently found for now
and should be fixed.

- Alex

changes since v2:

 - drop patches 2/3 and 3/3 as it looks okay. Sorry about the noise.
 - change commit messages regarding v2 changes.
 - add patch "fs: dlm: fix race in lowcomms"

Alexander Aring (2):
  fs: dlm: fix race in lowcomms
  fs: dlm: fix race between test_bit() and queue_work()

 fs/dlm/ast.c      | 6 ++++--
 fs/dlm/lowcomms.c | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.31.1

