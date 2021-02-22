Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A9992322087
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Feb 2021 20:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614023700;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oicvJqnR5PdnTmvzV+BHRxEXAk2EXHmEGiAEAMwlasU=;
	b=i23zoXozdkSa4iv5rekfw5KCDJsY5sewEXsm08nhbQbSJXi3+v462l/V+AoppSoTdtaSHA
	IQsL7nYbQbdb93USye+Wu5WP4Daz6yznQtNev9BDzu1lByrSqJkhAl0kO3YabZfjmyXJrr
	ob6Xvuc/AervBlVppq6u+bsxdJ2s/54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-WBnu8B6rO5qvgX5u-x-mEw-1; Mon, 22 Feb 2021 14:54:58 -0500
X-MC-Unique: WBnu8B6rO5qvgX5u-x-mEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F13A521F;
	Mon, 22 Feb 2021 19:54:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28C0B7086A;
	Mon, 22 Feb 2021 19:54:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7071B4EE4D;
	Mon, 22 Feb 2021 19:54:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MJsoMN005817 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 14:54:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16BEF111F6; Mon, 22 Feb 2021 19:54:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A44210CE7
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 19:54:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09A04186E122
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 19:54:47 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-514-Oloa4eWRMB6R56CbRY3QCw-1; Mon, 22 Feb 2021 14:54:45 -0500
X-MC-Unique: Oloa4eWRMB6R56CbRY3QCw-1
Received: by mail-wm1-f71.google.com with SMTP id f18so39059wmq.3
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 11:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=oicvJqnR5PdnTmvzV+BHRxEXAk2EXHmEGiAEAMwlasU=;
	b=ZOZuxUMv2WjnmMkCsBgp9ysR92+CBAzPnVVTXt4MYWzWNyjLmkV2CyHfEH6qjWa7Pq
	eLU4iNzho651fwLoqbyWGmx2e75eFFD/nRcB7mbl7RoxliEKmlKMmvmUGMm5LpUU3RZG
	DscJsGrwZZqObp90blDUGaPgytLVX0zI8dON50iBHU8syOHB56qMIaEvYhvr0Net4UIt
	2w0ScbLuO0NtpEO2FcG/WLf5r/LwoNQ68G0YliGJ2/xs0g2cW7pBdOHT7n1qQWPBomHA
	YOMcAcXbAKzntNPuhad1trW4yRIwzPU9u8/aOunE2zNyHtJnK9/tmq2oe7732oPTVbgG
	b4pw==
X-Gm-Message-State: AOAM532yd0HH3jEabVCm2a1XFT+nvydvq1pEoYjaWC9D1ZsLaF4V3kvm
	wUQlMcW/+0Dp8mtMcM1F8phJylHjVfRvd+j38PKbY+zUm0uMutK8M7uWLL1ZSU2YkjeRznrttET
	1f7eg9FFozxI8J5DMPT2xiLiR3O1YiKGYefFlQA==
X-Received: by 2002:a5d:6643:: with SMTP id f3mr1936057wrw.182.1614023683493; 
	Mon, 22 Feb 2021 11:54:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzRshlfwWQDbhOOSybcLm8rj3sdrJJNavuGVmqxUwUH1Q6RLPDHtBQMOgPXK4N2mHZ1FFsI1yJsOFE0cOfc2k=
X-Received: by 2002:a5d:6643:: with SMTP id f3mr1936039wrw.182.1614023683364; 
	Mon, 22 Feb 2021 11:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20210203180755.246596-1-agruenba@redhat.com>
	<20210203180755.246596-18-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-18-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 22 Feb 2021 20:54:32 +0100
Message-ID: <CAHc6FU7AyPtG81w38YP0O39ERrbOnj2rfseFrtbVAqS01BLcpw@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH v4 17/20] gfs2: No revokes for
 transactions at the tail of the log
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 7:08 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> In gfs2_log_flush, we're going through all active transactions.  For
> each of the buffers in those transactions that has completed, we either
> add a revoke to the active transaction immediately or we move the
> buffer to the transaction's ail2 list, which may result in a revoke
> later.
>
> However, whenever a transaction at the tail of the log completes, the
> current tail of the log advances.  gfs2_log_flush writes out the log
> header for the system transaction, with lh_tail set to that current tail
> (sd_log_flush_head).  This implicitly revokes all previous blocks in the
> log, so the revokes we've just written become obsolete.
>
> So instead of writing unnecessary revokes, just skip completed
> transactions at the tail of the log.

This patch is still causing problems during testing, so we'll put it
aside for now and fix it later.

Thanks,
Andreas

