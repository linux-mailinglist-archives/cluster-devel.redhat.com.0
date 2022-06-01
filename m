Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361D53AEB8
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Jun 2022 00:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654123506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kw3HesMwG9ecYh3hF/QYkWSG5OkE9NSd5C+/+dc9PlE=;
	b=eUTv2Z2/2d6Ie78gtFXRcCrSSFKerFEfZNx3TQQ6o3abeUmWMThiSF0egYwwkPVx+mqFeQ
	D+a0jiBxhwE23XkVM/qPDJi3PLrNE3I0WoyFweeWkk+c7HpyW11ndyprMginYUzxiQFYEI
	ynV/0iyMXCbbALnSsDjj7a5D5STYEwM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-9zgvAGgiPTyVIRbATRNOMA-1; Wed, 01 Jun 2022 18:45:02 -0400
X-MC-Unique: 9zgvAGgiPTyVIRbATRNOMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04DF73802B8C;
	Wed,  1 Jun 2022 22:45:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 347A71410F36;
	Wed,  1 Jun 2022 22:45:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E027F1947B89;
	Wed,  1 Jun 2022 22:44:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9E897194707F for <cluster-devel@listman.corp.redhat.com>;
 Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 91C853323E; Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E80482882;
 Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  1 Jun 2022 18:44:51 -0400
Message-Id: <20220601224454.1640688-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCHv2 dlm/next 0/3] fs: dlm: tracepoint changes
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this patch series contains some changes to the dlm tracepoint system.
Now we can ask about if stable candidate or not, the dlm tracepoint
system is relative new and I am doing some experiments right now and
need those changes. It should be still backward compatible... may some
small changes e.g. calling bast/ast tracepoint before calling callback
which makes more sense as other way around... I think it's fine to put
them in next as they are development tools anyway.

- Alex

changes since v2:
 - remove the not working +1 terminated null in res_name field to
   provide a null terminated string, the user need to deal with it now.

Alexander Aring (3):
  fs: change ast and bast trace order
  fs: remove additional dereference of lkbsb
  fs: dlm: add resource name to tracepoints

 fs/dlm/ast.c               |   4 +-
 fs/dlm/lock.c              |   4 +-
 include/trace/events/dlm.h | 118 ++++++++++++++++++++++++++++++-------
 3 files changed, 100 insertions(+), 26 deletions(-)

-- 
2.31.1

