Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1072447B
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 15:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686058379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AbOwRzmPQ0iAJYo3VfuHKdp9hqtbyOifH3hu5Ap+J9c=;
	b=blo/FA1yvcQGBQgi3VCCPbPVOxTi+EBcMXMtsqxKxHS69WnixY50rbPuEgM9MSOALJ8KZo
	RkEPGg45rS3zeFH/Oxq+sqx7a6hpmvqHrOWbfDGf7SKvsNiYEzwEe1R6BiEjqIXsMZN0w6
	3r56C5L9fcBk9ROQdGklYlb5jLbNVEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-vvkLHn5xNsGc1TCna4kwCA-1; Tue, 06 Jun 2023 09:32:57 -0400
X-MC-Unique: vvkLHn5xNsGc1TCna4kwCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E1C858F0F;
	Tue,  6 Jun 2023 13:32:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60C22140E957;
	Tue,  6 Jun 2023 13:32:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 16FDC19466DF;
	Tue,  6 Jun 2023 13:32:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 43C2F19465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 13:32:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 079EC2166B26; Tue,  6 Jun 2023 13:32:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F37372166B25
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 13:32:49 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D788A101A52C
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 13:32:49 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-PZgXgWcwOiu3aec2KD-3gw-1; Tue, 06 Jun 2023 09:32:48 -0400
X-MC-Unique: PZgXgWcwOiu3aec2KD-3gw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1afba64045aso44292615ad.0
 for <cluster-devel@redhat.com>; Tue, 06 Jun 2023 06:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686058366; x=1688650366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AbOwRzmPQ0iAJYo3VfuHKdp9hqtbyOifH3hu5Ap+J9c=;
 b=SddzyAcwLfvOXWQ9WHBVQtu7gZJglrjHVuxfn1zqVhdSGMM+xCqqxLKWlVUTKwXQ6q
 1h4wpKngkEEhbL9TZjezABwhZDVw8U+KPxFgQBgpqFLDkLJ0jwSv+Nr48qNZDIaCghPT
 wcWQtktyj58fkFP3OkXRQZQfXDJNav4So9bcdLIyZbe2ZFmtlYRVQGZoyJVu/rDHqOFp
 vUJMn20MSem3ZD33b0aOIXim/KHBtLM1uiT3VzefVZQYXAn3FOL8ikT238zAm3luo1BW
 yHJcsBiWFuyg4j50XTnQEDMBwghWj3v1ANUiiSq6oVZE29PrBhtjxM+yMr506s6SyfWM
 zPwA==
X-Gm-Message-State: AC+VfDwNp8TzKoq95F7HKdPj1gKvgMwswXBAzFGC0d9mVg2HMQzPNIHB
 4hO1ZKxkO63j0J0F23quj/LRrSqz3rfO69eJeRBNcpRFb1qtYUyyUuQGEJxWj4vz6mKaKY1yu/f
 s31NyJBTEWe0Bfx98mJ/BNIL98yLW88loNHpPJYTNDt665Z2Z
X-Received: by 2002:a17:902:c949:b0:1b0:3d03:4179 with SMTP id
 i9-20020a170902c94900b001b03d034179mr2465169pla.6.1686058366378; 
 Tue, 06 Jun 2023 06:32:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73rnlqqx/XsMWnWSX+E7IpatchnCGLGqyhgWVjBmyWLA/5l2n5ItAgVcqnz88C2iL+ihJ3U+zGY+1+7npgNe4=
X-Received: by 2002:a17:902:c949:b0:1b0:3d03:4179 with SMTP id
 i9-20020a170902c94900b001b03d034179mr2465159pla.6.1686058366041; Tue, 06 Jun
 2023 06:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230606124800.1151665-1-agruenba@redhat.com>
 <CAHk-=wi_P4tOWCbZYo11u5vbB+tTxCSGwKC9m71y-QdbZP8zKA@mail.gmail.com>
In-Reply-To: <CAHk-=wi_P4tOWCbZYo11u5vbB+tTxCSGwKC9m71y-QdbZP8zKA@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 6 Jun 2023 15:32:34 +0200
Message-ID: <CAHc6FU7e-ZwFg71S4a6UqdW5aagFPJAqGRhwwov+OMUHcY4UPA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 2:55=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Jun 6, 2023 at 5:48=E2=80=AFAM Andreas Gruenbacher <agruenba@redh=
at.com> wrote:
> >
> > - Don't get stuck writing page onto itself under direct I/O.
>
> Btw, is there a test for this DIO case?

The previous test case I wrote for these kinds of page faults is:

  "generic: Test page faults during read and write"
  https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=3Dd3cbd=
abff

I've added a check for this specific case, but this change hasn't been
posted/merged yet:

  "generic/728: Add mmap + DIO write test"
  https://gitlab.com/agruenba/xfstests/-/commit/8c37de03

> We've had the deadlock issue on t page lock (or for inode locks or
> whatever) for normal IO when faulting in the same page that is written
> to, and we have as pattern for solving that and I think there are
> filesystem tests that trigger this.
>
> But the DIO pattern is a bit different, with the whole "invalidate
> page cache: issue, and the fact that you send this patch now (rather
> than years ago) makes me wonder about test coverage for this all?

Yes, this case wasn't covered so far. The other page fault issues are
covered since 2021, and were fixed in gfs2 back then.

Thanks,
Andreas

