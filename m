Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6E98B2FBDC9
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 18:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611077824;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=am8qKgy2olSuTYXY41P5ywy+UMG49KosrjjN4odxWxw=;
	b=Fa1j7FPsGscada12Ect5I0p2uNPyG4MjPhr5bTv8hJLaoTchcsadhGAz1L2bUsOJuv7fWP
	EUT7NELDsfakAhlWD+/Oh3GxsDs4lxpmNQKE8gXyk573aawgW7oDi+8fY9WkMTs1ZDYi41
	s3Md+dsC2Ts89zL0HWFjwbxFfgNWadY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-DT2Pkx_2Myi2zxWk6k2Gyg-1; Tue, 19 Jan 2021 12:37:01 -0500
X-MC-Unique: DT2Pkx_2Myi2zxWk6k2Gyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEAF0107ACF5;
	Tue, 19 Jan 2021 17:36:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF55F60CF0;
	Tue, 19 Jan 2021 17:36:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A139C4A7C7;
	Tue, 19 Jan 2021 17:36:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JHanbk009323 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 12:36:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEF929C049; Tue, 19 Jan 2021 17:36:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7396A37B0
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 17:36:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A06D7101A563
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 17:36:46 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-P_b-ZO5qMha3udQ4G-k9KQ-1; Tue, 19 Jan 2021 12:36:44 -0500
X-MC-Unique: P_b-ZO5qMha3udQ4G-k9KQ-1
Received: by mail-wm1-f70.google.com with SMTP id 184so182423wmb.4
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 09:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=am8qKgy2olSuTYXY41P5ywy+UMG49KosrjjN4odxWxw=;
	b=LUQFRfivZ9s0li6gEds2/tflCUVES7Fh5DbZH0USwU3AxhciCwBC4CYlBsyaRzQvm9
	S7eayQsmOd975g35TrErqpbcwl8bK7VtBmPboqW5mVFL1tdnol7WC2IrxuII7iMw+6st
	wFGMipIRSsiVZU4Cr/mTtKDVVSkqv8jv2McZZX/BLkUhtqB3aWe/wFUlt8cUsYQiHJmd
	jTx6pHlGtJCAP0USxnNs6xYzP+5/682oX6X3cyzbMhsaMPyAft5yKeetuXestCplK42m
	xjx3hMP2F8sXU1nf/NIbO14ooFgxpE9HtuVeVt/oUsT/FcR9w13EZGndyoR6p4TsZzCR
	xX9g==
X-Gm-Message-State: AOAM530uW+pXH3dU2HQ6ldwzO6+DqWWUiYwz2AXQfGkaICbdEU7BofmV
	Gwuzr7hJC7oxz+/03EQZD+CCMEqlW1rzAuUoiXJizu5bSQ/elNgFwutl/bsW3Dt8JfzcPlttKWP
	4GG0sMskbqSsgr1aaVy7ZZ/TCFlCoBFHAEfowoA==
X-Received: by 2002:adf:fd10:: with SMTP id e16mr3658750wrr.376.1611077803663; 
	Tue, 19 Jan 2021 09:36:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzcyQr3nswKRZqwZy62AUnSIdvWGwVSKk3BK9jtEyybfy4Kaza4nGik5a9k3rWEJJ3CCc/1EurAT1/nQmveSE=
X-Received: by 2002:adf:fd10:: with SMTP id e16mr3658738wrr.376.1611077803515; 
	Tue, 19 Jan 2021 09:36:43 -0800 (PST)
MIME-Version: 1.0
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
	<561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
	<CAHc6FU7T5RzFhPWF_YbZY9a7+goVTPKrOybh46e12xe6zhL99Q@mail.gmail.com>
	<1287886465.45164472.1611071084974.JavaMail.zimbra@redhat.com>
In-Reply-To: <1287886465.45164472.1611071084974.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 19 Jan 2021 18:36:32 +0100
Message-ID: <CAHc6FU6sNa5CA1Q9deyuVhBA7RohHhb59m6PZ3-EMFueW6W6kg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 19, 2021 at 4:44 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Sure, the recovery workers' bio allocations and submitting may be serialized,
> but that's where it ends. The recovery workers don't prevent races with each
> other when using the variable common to all of them: sdp->sd_log_bio.
> This is the case when there are, for example, 5 journals with 5 different
> recovery workers, all trying to use the same sdp->sd_log_bio at the same time.

Well, sdp->sd_log_bio obviously needs to be moved to a per-journal context.

Thanks,
Andreas

