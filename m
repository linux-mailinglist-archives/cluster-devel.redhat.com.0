Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C655510B41
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Apr 2022 23:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651008487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1NNKOdd5hZdCc2XebY34PtdRYhwF5gKDIS0ZR9VPR4M=;
	b=HzVMFFm4+K1YstwklXm4O7hq1eNimunzOqYFPnplp60ur9STT582xhTtI3jZbxrRMKOSJZ
	ZqoHcCHtVHIda39UQ+EdAeV70/ais1Af2Q2ddwmpmIFx0cfcPIqdDqbSFNUeA93iGCBLY7
	xoGMB2D2zSJOgz7PIuyy47xggF5cpFw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-wh5nfxxMOCCLc7lOVJRQpg-1; Tue, 26 Apr 2022 17:28:03 -0400
X-MC-Unique: wh5nfxxMOCCLc7lOVJRQpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F02CA3C23FB2;
	Tue, 26 Apr 2022 21:28:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 558912166B2F;
	Tue, 26 Apr 2022 21:28:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 143571947BBF;
	Tue, 26 Apr 2022 21:28:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B38919451F0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 21:27:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1577714682C9; Tue, 26 Apr 2022 21:27:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F3914682C2
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 21:27:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED26C29DD981
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 21:27:58 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-L99H2djZNqKhzoOxocWFcw-1; Tue, 26 Apr 2022 17:27:57 -0400
X-MC-Unique: L99H2djZNqKhzoOxocWFcw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h61-20020adf9043000000b002079bbaa5d3so4811110wrh.16
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 14:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NNKOdd5hZdCc2XebY34PtdRYhwF5gKDIS0ZR9VPR4M=;
 b=VxWVy9qZDGKac3dcg75gtsHkXAbvXxc/gjysVbJ76GD3gHphcf3S4hx2ZRwG2HRbdb
 1FK4PS2fTPM/OUcB9ztGM49UkIKuW5oAdp5yqhth2+QofGGAIHGhLwmnktR9hpUeudtZ
 eiH/ViWuEmun+1hDM2ru3dX0OAY5QP7clYjCNPgQEd8iFzt3uac+3bV6mqeC31ry0gT3
 Pzm/fg1GfAJtaVQ+LhyrKnGFbr7SZmUY27+atGjyHivkKYpVMZxRb924Fx83C1wWU0US
 VZr6MS14/ECke1o1oSf5LqYBRhgtBqwglBJ9ENj5TsJZDJJ3NTxsWwzeFbIQG1DKOaVS
 2xqg==
X-Gm-Message-State: AOAM531X2+pTWKQ8rkft5wZAPwzE5SPbe+wVQLYwFFqfCf+Zd381fNPA
 Lqdob8jF1N8wHN3RcaAASrS9Be4R3Cy0XJHp7A4C0nR1+Nsp39icpJhTa8NvY71Q1d+6wMk49Bn
 O0zROoZo7Y1oDowGK9BYPcfe9iwVz8TsncGTHlw==
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id
 i10-20020adff30a000000b0020ae1936836mr5979570wro.654.1651008476386; 
 Tue, 26 Apr 2022 14:27:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz20rdg10F+wFBi4E6/EIxV7+oYM5DUa60mPxLlG5194kUNCrOFLQFcxaQdh1Qmb5CaNATHy1CbyKQKtBo3464=
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id
 i10-20020adff30a000000b0020ae1936836mr5979558wro.654.1651008476200; Tue, 26
 Apr 2022 14:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
In-Reply-To: <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 26 Apr 2022 23:27:44 +0200
Message-ID: <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 8:31 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Apr 26, 2022 at 7:54 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Also, note that we're fighting with a rare case of data corruption that
> > seems to have been introduced by commit 00bfe02f4796 ("gfs2: Fix mmap +
> > page fault deadlocks for buffered I/O"; merged in v5.16).  The
> > corruption seems to occur in gfs2_file_buffered_write() when
> > fault_in_iov_iter_readable() is involved.  We do end up with data that's
> > written at an offset, as if after a fault-in, the position in the iocb
> > got out of sync with the position in the iov_iter.  The user buffer the
> > iov_iter points at isn't page aligned, so the corruption also isn't page
> > aligned.  The code all seems correct and we couldn't figure out what's
> > going on so far.
>
> So this may be stupid, but looking at gfs2_file_direct_write(), I see
> what looks like two different obvious bugs.
>
> This looks entirely wrong:
>
>         if (ret > 0)
>                 read = ret;
>
> because this code is *repeated*.
>
> I think it should use "read += ret;" so that if we have a few
> successful reads, they add up.

Btrfs has a comment in that place that reads:

    /* No increment (+=) because iomap returns a cumulative value. */

That's so that we can complete the tail of an asynchronous write
asynchronously after a failed page fault and subsequent fault-in.

> And then at the end:
>
>         if (ret < 0)
>                 return ret;
>         return read;
>
> looks wrong too, since maybe the *last* iteration failed, but an
> earlier succeeded, so I think it should be
>
>         if (read)
>                 return read;
>         return ret;
>
> But hey, what do I know. I say "looks like obvious bugs", but I don't
> really know the code, and I may just be completely full of sh*t.

That would be great, but applications don't seem to be able to cope
with short direct writes, so we must turn partial failure into total
failure here. There's at least one xfstest that checks for that as
well.

> The reason I think I'm full of sh*t is that you say that the problem
> occurs in gfs2_file_buffered_write(), not in that
> gfs2_file_direct_write() case.

Right, we're having that issue with buffered writes.

> And the *buffered* case seems to get both of those "obvious bugs" right.
>
> So I must be wrong, but I have to say, that looks odd to me.
>
> Now hopefully somebody who knows the code will explain to me why I'm
> wrong, and in the process go "Duh, but.." and see what's up.

Thanks for pointing out the places that seem odd to you. You'll not be
the only one.

Andreas

