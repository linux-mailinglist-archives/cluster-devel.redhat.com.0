Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5306686B3
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561956;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pxkoe2RkLl3vyzlVKm8hCSl6DDzgInZ/xot0ccs6c2E=;
	b=Wt707p7ntEU3cxMOb4eoRt6qavrkoZV/W7AV9gP3eoEfkvZ5nON4qvRSFWvzNyz5aErqes
	Tks3s53EuI/5tkU8YRB/s/YI7y6tatWJcsYalCa7GnjwFTHmShkX71j4kf5V4FDvkLHPFC
	MV9SadeHU5MkvrVfrNi7U+fAMhrkjJY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-hQTeB3RrO0yswI8audlWzQ-1; Thu, 12 Jan 2023 17:19:13 -0500
X-MC-Unique: hQTeB3RrO0yswI8audlWzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67F992817259;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD14407D466;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E08C1947051;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 21BBB1947053 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B0BC40C2004; Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1148D40C2064;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:41 -0500
Message-Id: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 0/8] fs: dlm: better handling for
 new stop/start testcase
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

I previously send some patches which should queued up for stable. This
patches tries to make the behaviour better for the midcomms layer in a
very specific corner case of invoking stop/start of midcomms/lowcomms
in a looping behaviour.

I am using dlm_locktorture module which isn't upstream but can be found
at [0]. Have it as a module, I am doing a:

while true;do modprobe dlm_locktorture cluster=gohan;rmmod dlm_locktorture;done

on all cluster nodes will invoke the testcase which tests a specific
corner case to call midcomms/lowcomms start and stop again on all
cluster nodes. Between we might have some locking requests happening.
Those patches makes this specific corner case better to handle, it's
still not perfect and in futurue we should look again into this specific
behaviour of adding/removing lockspaces in a looping behaviour. However
it is a very corner testcase which probably does not occur a lot in
practice. We might also need to try to simplify the whole process and
have a better behaviour for dlm version detection as it's currently is.

- Alex

[0] https://gitlab.com/netcoder/linux-public/-/commit/cb67a3c99f0eb1e5860a9e27015e6dbd00bbcc34

Alexander Aring (8):
  fs: dlm: bring back previously shutdown handling
  fs: dlm: change to ignore unexpected non dlm opts msgs
  fs: dlm: wait until all midcomms nodes detects version
  fs: dlm: make dlm sequence id handling more robust
  fs: dlm: reduce the timeout time to 5 secs
  fs: dlm: remove newline in log_print
  fs: dlm: move state change into else branch
  fs: dlm: remove unnecessary waker_up() calls

 fs/dlm/lockspace.c |  5 ++-
 fs/dlm/lowcomms.c  | 77 +++++++++++++++++++++++++++++++++-------------
 fs/dlm/midcomms.c  | 74 ++++++++++++++++++++++++--------------------
 fs/dlm/midcomms.h  |  1 +
 4 files changed, 102 insertions(+), 55 deletions(-)

-- 
2.31.1

