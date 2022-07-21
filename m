Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E957D64D
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Jul 2022 23:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658440445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IUfAq6zGEfHyLcp/TKUpOtwfJo5pu7OT1SEaV7e3QOI=;
	b=KezdBwyarG5ooEFoF+38jzoYgIXHoCPegbmy+fJV5rac8PVb1gld3XKxBESMu1s4demll1
	WJHNeGWxWcNWn2oElCPnIZQdOhu5IGZOvl0sKccC2iFSJt2pif+sk8YAqgo64Y9HNMDQLB
	9eFCjWOdxGH+HXRtwWTpHiV4HePGtYc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-GwznkxMROOS3k3C1kpUC9g-1; Thu, 21 Jul 2022 17:53:59 -0400
X-MC-Unique: GwznkxMROOS3k3C1kpUC9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D35751C006A9;
	Thu, 21 Jul 2022 21:53:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC0B21121314;
	Thu, 21 Jul 2022 21:53:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A62AE195354C;
	Thu, 21 Jul 2022 21:53:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 883FC1953546 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A0E62026985; Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 415B02026D64;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 21 Jul 2022 17:53:37 -0400
Message-Id: <20220721215340.936838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH dlm/next 0/3] fs: dlm: some callback fixes
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

I currently look a little bit deeper into the callback handling of dlm
and I think we have some issues there. Especially with the refcounting
and queue_work() per lkb. I have some local branches which does more
some rework and moving away from the lkb_callbacks[] array per lkb and
using a queue for handling callbacks. However those are issues which I
currently found for now and should be fixed.

- Alex

Alexander Aring (3):
  fs: dlm: fix race between test_bit() and queue_work()
  fs: dlm: avoid double list_add() for lkb->lkb_cb_list
  fs: dlm: fix refcount handling for dlm_add_cb()

 fs/dlm/ast.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.31.1

