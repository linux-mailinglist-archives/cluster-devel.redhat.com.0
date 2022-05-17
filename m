Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6D52A06B
	for <lists+cluster-devel@lfdr.de>; Tue, 17 May 2022 13:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652787060;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+CIm7p5THgEh18knbYXJiwJfzA2wa4p4rpK4WIeS0kg=;
	b=cLTRtCbvWXMUm/I3pStAtUF9+Abg4Rr5Hx3BuOqIcTIGkxuQz1GyFA+vXiwBRtJQzauSF3
	qBtjpQNOc8+LZTABps6Z20RNLK/kdLIKWKkBnGcqNjCTE8xkcEXdOKFB0MRoNuURsN0Qn7
	dXcbxn1iAJsp6UtBu0bRYXw7BrU9cOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-UiJdMDK1OTi1_Yv30QlY_g-1; Tue, 17 May 2022 07:30:58 -0400
X-MC-Unique: UiJdMDK1OTi1_Yv30QlY_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19FD866DF5;
	Tue, 17 May 2022 11:30:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56C73C15D40;
	Tue, 17 May 2022 11:30:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E35751947063;
	Tue, 17 May 2022 11:30:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EE411947056 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 17 May 2022 11:30:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7EE232026D2D; Tue, 17 May 2022 11:30:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AECE2026D6A
 for <cluster-devel@redhat.com>; Tue, 17 May 2022 11:30:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F5442949BA8
 for <cluster-devel@redhat.com>; Tue, 17 May 2022 11:30:44 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-Qcyz7dZmNLqywEVCrHhdJQ-1; Tue, 17 May 2022 07:30:43 -0400
X-MC-Unique: Qcyz7dZmNLqywEVCrHhdJQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e6-20020adfef06000000b0020d08e465e2so1135984wro.3
 for <cluster-devel@redhat.com>; Tue, 17 May 2022 04:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CIm7p5THgEh18knbYXJiwJfzA2wa4p4rpK4WIeS0kg=;
 b=Q0nu5Sn/awRy2xKllN/CnAiwfYNhJxwjDn5cHU1NpNDKepwWJByA967a6ZSJ+0dIfL
 5xrlSJJWjCPf7ZKdYP56kAWGGX6w14SM/ZeaugH2Fqnjf2e46PJE3j3sC7xGixDY/oB3
 tBFRIbMfHIKoDm+eT3hGCpK+l+J77fWh23zf+ROsTzztwVXpGebipsr3XTUnaroT/3IP
 AX9bFGnD3JBAZZExw/59jPNE3NfgrKeAIltr4SlDKGGyCw2L7dCyVpmRZH+hiUgtDKwP
 MDHMA0Zi6SXH9i52N7DdYjXLW7FziWyL+KRAYmchu6x+7rBjjGCDaa/rhZsammtoDXOb
 l5vQ==
X-Gm-Message-State: AOAM532Bbij/g2iFs3V0RqE3wMQ163EcrqqzoFcBtoiK/83zYJsfVx3G
 KAmNdB5QXMaS6ychvqXdZ4WuX1UP2OTImiR4jfM9XtTF7Z2iES/X00jHAqflGdPAcIQmm2+2NK5
 q4FVpn9eoW/LKl0YfidTV2MR7comAATLpHzGi6g==
X-Received: by 2002:a5d:47ac:0:b0:20d:3ceb:3b53 with SMTP id
 12-20020a5d47ac000000b0020d3ceb3b53mr3655889wrb.493.1652787041659; 
 Tue, 17 May 2022 04:30:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydul+K4lgVlMZhE1+mLHP6N/ngTeRrtlb2/3EwnWB4la711foXuOpQV3gbU6uwK2G+YlvAILgNP7aZqPL0diY=
X-Received: by 2002:a5d:47ac:0:b0:20d:3ceb:3b53 with SMTP id
 12-20020a5d47ac000000b0020d3ceb3b53mr3655875wrb.493.1652787041434; Tue, 17
 May 2022 04:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220405120847.583327-1-anprice@redhat.com>
 <b5fcfcbd-104f-ea1a-f808-769c7bd8b91f@redhat.com>
 <4f808327-b831-f546-8d3f-5dfdf849bdef@redhat.com>
 <5488b93e-96c8-9007-9ee4-667247fa8c30@redhat.com>
In-Reply-To: <5488b93e-96c8-9007-9ee4-667247fa8c30@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 17 May 2022 13:30:30 +0200
Message-ID: <CAHc6FU5MgeJJfqvfkRau3ccEpfT0iLE3FGk9Md4dhrA2nZH5Gw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH RESEND] gfs2: Return more useful errors
 from gfs2_rgrp_send_discards()
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 12:41 PM Andrew Price <anprice@redhat.com> wrote:
> On 29/04/2022 15:08, Andrew Price wrote:
> > On 19/04/2022 16:49, Andrew Price wrote:
> >> On 05/04/2022 13:08, Andrew Price wrote:
> >>> The bug that 27ca8273f ("gfs2: Make sure FITRIM minlen is rounded up to
> >>> fs block size") fixes was a little confusing as the user saw
> >>> "Input/output error" which masked the -EINVAL that sb_issue_discard()
> >>> returned.
> >>>
> >>> sb_issue_discard() can fail for various reasons, so we should return its
> >>> return value from gfs2_rgrp_send_discards() to avoid all errors being
> >>> reported as IO errors.
> >>>
> >>> This improves error reporting for FITRIM and makes no difference to the
> >>> -o discard code path because the return value from
> >>> gfs2_rgrp_send_discards() gets thrown away in that case (and the option
> >>> switches off). Presumably that's why it was ok to just return -EIO in
> >>> the past, before FITRIM was implemented.
> >>>
> >>> Tested with xfstests.
> >>
> >> Can I get a thumbs-up or thumbs-down for this patch? It's pretty
> >> straightforward. I just don't want it to get forgotten about.
> >>
> >> Cheers,
> >> Andy
> >
> > Please could you take this patch?
> >
> > Cheers,
> > Andy
>
> For convenience, I've pushed this patch to gitlab:
>
>    git fetch https://gitlab.com/andyprice/linux.git discard_errors
>    git show FETCH_HEAD

Pulled, thanks.

Andreas

