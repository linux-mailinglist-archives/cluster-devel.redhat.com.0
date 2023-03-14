Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2106B95D9
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Mar 2023 14:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678799922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7FqAnirIoO7gSEisI6HOWHukqIIdelWVHVBQ1tXVj8g=;
	b=MMQPkNbalz+qGWW43WM8uExUxQpduP/21u72KavF4ZDlyrKKTHgTKbjr3p+CrpkXefUvfF
	QV6cvX7fWk/ZO0C97xaMZyWA7uDRpskjLNpCKsoaEGmieNw2w6IsvhF8ZjpBUFcB65QUfE
	XkG1rNn+I5ZeerMnjrjscoO89L20kTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-wHjiVFpiO0eCiokNVRNUEQ-1; Tue, 14 Mar 2023 09:18:37 -0400
X-MC-Unique: wHjiVFpiO0eCiokNVRNUEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85A5280D0F7;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7BF3202701E;
	Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9EEC619465A4;
	Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FEFF1946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Mar 2023 13:18:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42BEC400F5D; Tue, 14 Mar 2023 13:18:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.36.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82CFB47507A;
 Tue, 14 Mar 2023 13:18:32 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: agruenba@redhat.com,
	rpeterso@redhat.com
Date: Tue, 14 Mar 2023 13:18:26 +0000
Message-Id: <20230314131829.18515-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 0/3] gfs2_(un)link cleanups
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Some trivial cleanups from my O_TMPFILE branch. That work isn't ready
yet but there was no reason not to send these patches.

Andy

Andrew Price (3):
  gfs2: Remove duplicate i_nlink check from gfs2_link()
  gfs2: Remove ghs[] from gfs2_link
  gfs2: Remove ghs[] from gfs2_unlink

 fs/gfs2/inode.c | 47 ++++++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

-- 
2.39.2

