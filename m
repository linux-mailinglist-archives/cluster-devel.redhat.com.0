Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C16C7305
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Mar 2023 23:22:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679610151;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jMsUA1oydzTRboxQIpYrDLUbNVlpVOoAHdk0YZIU4iA=;
	b=aEIaU2Qj8cjrUIHdXSdMcJSNVrzy6wgUDjVTjeMxKruR9huXZrM3ogoCwUFkLoZJ4i6hS2
	sXHuwEOVtlLxDEA3zIaQo2RhXkZsszAAEbd8ddbD+CE9QFzEaLrVJgFW+gyl6y/C0WDtxY
	a8KES8ywBKmJfBUKCNmnh3djXmZcTHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-5y7lO5JGO1-B73xYrBUYYw-1; Thu, 23 Mar 2023 18:22:28 -0400
X-MC-Unique: 5y7lO5JGO1-B73xYrBUYYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5313B85A588;
	Thu, 23 Mar 2023 22:22:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECAB6492C3E;
	Thu, 23 Mar 2023 22:22:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAAD819465BB;
	Thu, 23 Mar 2023 22:22:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71AB31946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Mar 2023 22:22:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 548982166B2A; Thu, 23 Mar 2023 22:22:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D9E82166B29
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 22:22:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4D93C0F382
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 22:22:25 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-rXG0V9QiMgaRISd6Sv7GEQ-2; Thu, 23 Mar 2023 18:22:21 -0400
X-MC-Unique: rXG0V9QiMgaRISd6Sv7GEQ-2
Received: by mail-qt1-f169.google.com with SMTP id c19so28758673qtn.13;
 Thu, 23 Mar 2023 15:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679610141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMsUA1oydzTRboxQIpYrDLUbNVlpVOoAHdk0YZIU4iA=;
 b=lEGumVybNkEFBSPMti+tmP8LdTAGto3WImRigCcPkHrq/IZ5si7gBygBqrTMivnLOR
 HiyTRlO0AuB9Ku7JEtkV0hGA2H/FMtt/5QuW8qQUGpcvwLEIL7wkqWx1JHsAvHLIbQqy
 Hy71bcgr94p44L+dKpEX2gSH9TGkJMrp6MoYz1E4yXh7+YJ0PNF/x9+4nJDHtQ6cFLPd
 XCAPRInSK+lH6cuHSCSHQ625ztL9zDaZlimmC1aIsDLRclsuInV5CtIApglL5zqzd5iB
 QzLyCNe9xaLNA7xlDIilSPjjvH1rMSEV33hUII3h13+W732lmVg4tzSCzUKt+4LdZ1Dn
 e1dw==
X-Gm-Message-State: AO0yUKV9jcJlEcOJl57cQ5hu6W+223ME9Xp1Cv7ABtnnEJ8tTojIZoTW
 fkC62f95Lew4MPoLwfUpcswj3bBFJGsyUXmLEba3Quo4iPQ=
X-Google-Smtp-Source: AKy350aa0KWzSeHgdqqXQ5iqfK6nxAouutaHE/1/UEDsP9satJOhqrY5hmFgU/AeFHi0JOKTOiu+susu7/MDo5VUoqg=
X-Received: by 2002:a05:622a:1a8c:b0:3de:65db:2127 with SMTP id
 s12-20020a05622a1a8c00b003de65db2127mr357059qtc.1.1679610140817; Thu, 23 Mar
 2023 15:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230323184537.749868-1-agruenba@redhat.com>
 <CAHk-=whms=0Cvmk946a0Pebv1YLWiuYCjyVy6yNeBp55+R8sMw@mail.gmail.com>
In-Reply-To: <CAHk-=whms=0Cvmk946a0Pebv1YLWiuYCjyVy6yNeBp55+R8sMw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Thu, 23 Mar 2023 23:22:10 +0100
Message-ID: <CAHpGcMKO-C=+wPprBGnOLeA+6_PJhHatO3fANizXNAtG2kYRcA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix for v6.3-rc4
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Do., 23. M=C3=A4rz 2023 um 22:54 Uhr schrieb Linus Torvalds
<torvalds@linux-foundation.org>:
> On Thu, Mar 23, 2023 at 11:45=E2=80=AFAM Andreas Gruenbacher <agruenba@re=
dhat.com> wrote:
> >
> > From: Linus Torvalds <torvalds@linux-foundation.org>
>
> Wat?

Hmm, that's weird, you ended up in the From: header by accident. Sorry for =
that.

> >   git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git gfs=
2-v6.3-rc3-fix
>
> -ENOSUCHTAG
>
> > for you to fetch changes up to 260595b439776c473cc248f0de63fe78d964d849=
:
>
> .. and no such commit available in any other tag or branch either.
>
> Did you forget to push out?

Yes, I did forget to push the tag out and I've missed the warning "git
request-pull" has spit out. Sorry again.

I've pushed the tag out now; should I resend the pull request?

Thanks,
Andreas

