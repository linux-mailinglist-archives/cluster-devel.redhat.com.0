Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E86754555
	for <lists+cluster-devel@lfdr.de>; Sat, 15 Jul 2023 01:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689376930;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h+X09fj27AK4/3pww3xE1DH8gg7k6xAyYOWy2jHq9KU=;
	b=VTfRITg2l91paviRyOrnXnhN3Y+tM7VY8td3LAzERqQD6RI5LB32UKtcU0rn2M5mL8eAGb
	Ir8YUragi6t6tdAnWIS4SBrDegn/D4/hCW8QNw3roiViK60x5/9N0AETvws50QDo2p5Lin
	pacz//AqkL6luv7PbjYzPUNHBmdpuKo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-P6YHKMRrNWe4iGMQ_uq_9g-1; Fri, 14 Jul 2023 19:22:07 -0400
X-MC-Unique: P6YHKMRrNWe4iGMQ_uq_9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A28E78D1687;
	Fri, 14 Jul 2023 23:22:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 462D92166B25;
	Fri, 14 Jul 2023 23:22:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF9B61946595;
	Fri, 14 Jul 2023 23:22:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9734C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Jul 2023 23:22:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54C412166B26; Fri, 14 Jul 2023 23:22:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C8062166B25
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 23:22:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 250A0185A78B
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 23:22:03 +0000 (UTC)
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-kBSY7MR9OfCHJkoUOQmctw-1; Fri, 14 Jul 2023 19:21:59 -0400
X-MC-Unique: kBSY7MR9OfCHJkoUOQmctw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5704991ea05so18857437b3.1
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 16:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689376919; x=1691968919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+X09fj27AK4/3pww3xE1DH8gg7k6xAyYOWy2jHq9KU=;
 b=aHdLQF1FneMPgcYZae4mSO+WN2jC6hKjNbbudGwMHIevvidxwYlmTOxg2f2gZ6X5uS
 IQDOd/JXB3GX+GOYQvi39/os/vYMjUFj/9Vp5mHrNntlbsVFXLyTmtHlsP9hdktL45Av
 5uGUxCRVuPWVmrT+9LTi7MoNR/aKcdEZgfg8yaSlib6RwJmAN9kjHrt4DeKX1YNW1URW
 qKtQtcujXVmiO5Gjjc9daEk0A0sUkwu29X4UyGfX44yFfyUAmNW72GcEC8O3QyHuQfS1
 d+hx0VjsR5vewAa38HO9mn2NHpM89/ynYNtjmxUXkCRAHmW8tx6SBDiu939tTqraZdVH
 gNCQ==
X-Gm-Message-State: ABy/qLZaf/YIUGpjFSrf1HPh4tI+fi8BpZqNdVKSzeywMZyaEmehXfDq
 gg2aXZOidft5fAYFl2UnZ/Lo6CV5Wfv2fHEgbCNxPZtgd3pyRzkET9+/W6hrIndbO6cbfjmgfc8
 H2ECPQDdKfpX48Pt4N8PSt0hsXV3+fIOiPUi5PMJTNw4GUoUC
X-Received: by 2002:a81:6642:0:b0:577:51cd:1b4a with SMTP id
 a63-20020a816642000000b0057751cd1b4amr5632735ywc.41.1689376919168; 
 Fri, 14 Jul 2023 16:21:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH87tii74fYhQOB2UmnURixuj47NPlikm9zKn4Uxb8LU4kBw2+Og04U9kZAJbGCRPAHQSZ5GLvhopXLprX908I=
X-Received: by 2002:a81:6642:0:b0:577:51cd:1b4a with SMTP id
 a63-20020a816642000000b0057751cd1b4amr5632726ywc.41.1689376918933; Fri, 14
 Jul 2023 16:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230713144029.3342637-1-aahringo@redhat.com>
 <CAHc6FU542V6T8F8W-npN24zVJih5iRckGHqHLPrVHLhLqWBOgA@mail.gmail.com>
In-Reply-To: <CAHc6FU542V6T8F8W-npN24zVJih5iRckGHqHLPrVHLhLqWBOgA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 14 Jul 2023 19:21:47 -0400
Message-ID: <CAK-6q+gZU5ukDW584PRf=L_08Jx-G6OHgJG1804a6LxjDtoORA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v6.5-rc1 1/2] fs: dlm: introduce
 DLM_PLOCK_FL_NO_REPLY flag
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2023 at 9:54=E2=80=AFAM Andreas Gruenbacher <agruenba@redha=
t.com> wrote:
>
> On Thu, Jul 13, 2023 at 4:40=E2=80=AFPM Alexander Aring <aahringo@redhat.=
com> wrote:
> > This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
> > plock operation should not send a reply back. Currently this is kind of
> > being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
> > meanings that it will remove all waiters for a specific nodeid/owner
> > values in by doing a unlock operation. In case of an error in dlm user
> > space software e.g. dlm_controld we get an reply with an error back.
> > This cannot be matched because there is no op to match in recv_list. We
> > filter now on DLM_PLOCK_FL_NO_REPLY in case we had an error back as
> > reply. In newer dlm_controld version it will never send a result back
> > when DLM_PLOCK_FL_NO_REPLY is set. This filter is a workaround to handl=
e
> > older dlm_controld versions.
>
> I don't think this makes sense. If dlm_controld understands a
> particular request, it already knows whether or not that request
> should receive a reply. On the other hand, if dlm_controld doesn't
> understand a particular request, it should communicate that fact back
> to the kernel so that the kernel will know. The kernel knows which
> kinds of requests should and shouldn't receive replies, so when it is
> sent a reply it doesn't expect, it knows that dlm_controld didn't
> understand the request and is either outdated or plain broken. The
> kernel doesn't need to pipe a flag through dlm_controld for figuring
> that out.
>

It's already part of UAPI that a flag signals that a reply is not
expected [0]. If this flag is set and current user space software did
not understand the request (or any possible future user space error
handling) it will send a reply back which cannot be matched and with
the current match logic it will match the wrong one.
I would say it is broken and probably we don't care because we never
assume that an error will happen, we just need to be careful to not
add any other possible reply for errors in future.

The bigger problem is to introduce new ops [1] (not flags) on the
kernel side which does not send a reply back. Older user space
software will not understand the optype and will send a reply, newer
software will not send a reply (because it understands the optype).

Therefore I think we should never introduce a new optype which does
not send a reply back. The new DLM_PLOCK_OP_CANCEL was trying to do
that, that's why I tried to fix this behaviour which is another ugly
workaround passing flags around.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/plock.c#n395
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/uapi/linux/dlm_plock.h?h=3Dv6.5-rc1#n21

