Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4E44AE31D
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Feb 2022 22:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644356777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p5JbXduQWKR757ED+UYpZ/63UBSGPnv3sjv8Q90Zhwo=;
	b=h478mnB4GKSGajNatyRcKSlRvoV7mbfwI73l93zj9+jELWv7VcGaCCJEGvyZFuPSBGPwxo
	9/XjqcW5+zF54vPRnIAmzw7NCDuZv61k8pdiBq5J95fuxqsqL/UzlfFWNQxW2bNADbhNtk
	U5R3+ah5BAX+b/d5k6iSqdcUIrjJ2Ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-R7UFhEC-Mxe1Ni_Af12e6Q-1; Tue, 08 Feb 2022 16:46:13 -0500
X-MC-Unique: R7UFhEC-Mxe1Ni_Af12e6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E0CF8463D7;
	Tue,  8 Feb 2022 21:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A87F5DB8D;
	Tue,  8 Feb 2022 21:46:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20F1018218A5;
	Tue,  8 Feb 2022 21:46:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 218LcBPW006045 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 16:38:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B42BF4CED9; Tue,  8 Feb 2022 21:38:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E48674CEDF;
	Tue,  8 Feb 2022 21:37:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  8 Feb 2022 16:37:46 -0500
Message-Id: <20220208213749.997455-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 0/3] dlm: fix annocheck failures
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch series fixes some issues by running annocheck. [0]

- Alex

[0] https://sourceware.org/annobin/

Alexander Aring (3):
  treewide: do always -Wl,-z,now in LDFLAGS
  dlm_controld: add -fplugin=annobin to CFLAGS
  treewide: add -fcf-protection=full to CFLAGS

 dlm_controld/Makefile |  8 ++++----
 dlm_tool/Makefile     |  4 ++--
 fence/Makefile        |  4 ++--
 libdlm/Makefile       | 11 +++++------
 4 files changed, 13 insertions(+), 14 deletions(-)

-- 
2.31.1

