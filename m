Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF66AE821
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gDCkBPBi63t5A5UFIy2Uu+NqVXsKIS63LXvMWJZ4yY0=;
	b=ZexYM1gcczzl91byzwy10xt7qLO1i+GgzRaFwe4JBLXLVOaV/rCE2lRnr+EUTJyr71W5Mb
	xHUBOrlyvfFg66YmSxoX4yE6H7zHGCIVW2SSQoR/ScVxxH6o0pUApGodhhLqze6bPcldSS
	VB3/o6H07W+ObGM+CoAraPJcTzzT10Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-V_nKqznKP3C0jOYs7SX_Jg-1; Tue, 07 Mar 2023 12:13:16 -0500
X-MC-Unique: V_nKqznKP3C0jOYs7SX_Jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47A561C426A8;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B2201121314;
	Tue,  7 Mar 2023 17:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEB5E19465B2;
	Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 695371946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D4CD14171C3; Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27236140EBF4;
 Tue,  7 Mar 2023 17:13:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:12:58 -0500
Message-Id: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 0/9] dlm-tool: pending
 fixes/cleanups dlm-tool patches
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

this is a resend of a subset of pending dlm-tool patches just without
the dlm_controld functionality to plot the dlm_controld posix cluster-wide
lock states over time. I split this feature out to have at first those
cleanups in fixes/dlm userspace instead of doing a new feature at the
same time now which has more things to dicuss about.

- Alex

Alexander Aring (9):
  dlm_tool: add fail functionality if dump failed
  dlm_controld: always create logdir
  dlm_controld: move processing of saved messages to plock level
  dlm_controld: remove ls parameter
  dlm_controld: constify timeval of dt_usec()
  dlm_controld: add gcc format printf attribute to log_level
  dlm_controld: use write_result()
  dlm_controld: be sure we stop lockspaces before shutdown
  dlm_controld: constify name_in in log_level()

 dlm_controld/daemon_cpg.c    | 16 ++++++++--
 dlm_controld/dlm_daemon.h    |  3 +-
 dlm_controld/lib.c           | 25 +++++++++-------
 dlm_controld/libdlmcontrol.h | 10 +++----
 dlm_controld/logging.c       | 36 +++++++++++------------
 dlm_controld/plock.c         | 25 ++++++++--------
 dlm_tool/main.c              | 57 +++++++++++++++++++++++++++---------
 7 files changed, 108 insertions(+), 64 deletions(-)

-- 
2.31.1

