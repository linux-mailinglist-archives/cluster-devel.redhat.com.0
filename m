Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A0D9E2D79C2
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Dec 2020 16:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607701661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5TFEGdW2EZHVm9Bf5E6kfW9Vue4JzVRDcepX4Yys62Q=;
	b=dBJMg4oiHL7gyPAhncjHICuY9G0xxtCAyRZlHLOUzJxBDOV9WsJPhVmX/zT7TX6Nxdakx6
	3ZTgkOMGOxNisJHPt2Ow+euikep5IhFNS/8AlIAox8py1YbvZthhgLFK5K1a9XgQFlzWV0
	oPSeQoiK8VLbqOUaTAaEyDW9ujFVLGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-PDPJLdTuOwmvGJ8g6tOuPw-1; Fri, 11 Dec 2020 10:47:40 -0500
X-MC-Unique: PDPJLdTuOwmvGJ8g6tOuPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D410B19611A0;
	Fri, 11 Dec 2020 15:47:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A3A5F9A6;
	Fri, 11 Dec 2020 15:47:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADF82180954D;
	Fri, 11 Dec 2020 15:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BBFlMBM013733 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 10:47:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D30B757; Fri, 11 Dec 2020 15:47:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-44.rdu2.redhat.com [10.10.114.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53FFA5F708;
	Fri, 11 Dec 2020 15:47:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 11 Dec 2020 10:47:16 -0500
Message-Id: <20201211154718.99346-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 0/2] fs: dlm: dlm lock from user
	space fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

found some issues with the user space fixes and that we don't have
proper aligned dlm messages. I found these issues while having my
pending patches applied which introduced a "hart" assert for this and
dropping messages on such case. With this assert dlm will probably not
backwards compatible anymore...

so here my question/suggestion:

We should queue these patches to stable?

- Alex

btw: these patches can be applied, I will send PATCHv3 for my pending
patches, I added two other patches.

Alexander Aring (2):
  fs: dlm: check for invalid namelen
  fs: dlm: transparently align name buffer

 fs/dlm/user.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.26.2

