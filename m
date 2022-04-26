Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9860510708
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Apr 2022 20:31:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-JYMXFdlIPFOTMYbrF1EZgw-1; Tue, 26 Apr 2022 14:31:46 -0400
X-MC-Unique: JYMXFdlIPFOTMYbrF1EZgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 115432803AF2;
	Tue, 26 Apr 2022 18:31:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26F7941136E2;
	Tue, 26 Apr 2022 18:31:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E5E61947BBF;
	Tue, 26 Apr 2022 18:31:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8CAEB19451F0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 18:31:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76FF241136E6; Tue, 26 Apr 2022 18:31:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72DA341136E0
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 18:31:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69955811E7A
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 18:31:28 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-wjhjEB4YPSGUsyjr5YkEgQ-1; Tue, 26 Apr 2022 14:31:26 -0400
X-MC-Unique: wjhjEB4YPSGUsyjr5YkEgQ-1
Received: by mail-lj1-f172.google.com with SMTP id 4so9572336ljw.11
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 11:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSl7xq4Yk/sCSUVQJxnflrAuEW8yu3ogjHhbkJ5P7LA=;
 b=s7ktJurrcMj2dA02NR9tjeXz07qLc7mFvnDxhxcNa9DTgv60dSNRvWfrmnsVyq1/ug
 8u7IduozHpl9n3EoNRSSVt2VBIOH7QfLF/kNjqMiPvtHdVczV4KZraLn90AgTOmv+GUq
 Zi2gIEdaTQhT3XDgnAT0Gj16e/MVAeUz6rAfbEK85AJZf5gxaWE68nDPI/WQT+T1bGlQ
 v6Z0sNzxNpcZwKUOAbpxIAQTL3fY9pq5TFNvfDosjHsvnx4vmfzWWsKN/3SAATDYvzjT
 BQkhBkV8GeSeLsjAf6+iRr0txmIuCBUwoV2rf4Vkr3/fgiFfJ/k6PpjX2lRzwZ4ZX0/f
 Wr3w==
X-Gm-Message-State: AOAM530drBN7hp9AzQgYQPjR+KgXzi/2RTIuQ9H2GK6spwDGRT8NNN6K
 vQnahUDdAXIYETNqFVI7vbyZceYwsjlShVA0
X-Google-Smtp-Source: ABdhPJwiIRJh88zCHnWgMg4k6vSxKQi+IuMoSMb+0EQN66+NUUAbtD13w+Go7VFPACiTkVGQSsJbSA==
X-Received: by 2002:a05:651c:b2b:b0:24f:2784:844d with SMTP id
 b43-20020a05651c0b2b00b0024f2784844dmr238729ljr.190.1650997878948; 
 Tue, 26 Apr 2022 11:31:18 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 n26-20020a2e905a000000b0024f0c808b09sm1003825ljg.48.2022.04.26.11.31.18
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:31:18 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id w19so33439760lfu.11
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 11:31:18 -0700 (PDT)
X-Received: by 2002:a05:6512:1083:b0:472:1013:aad1 with SMTP id
 j3-20020a056512108300b004721013aad1mr5403728lfg.52.1650997877977; Tue, 26 Apr
 2022 11:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
In-Reply-To: <20220426145445.2282274-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Apr 2022 11:31:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
Message-ID: <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 7:54 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Also, note that we're fighting with a rare case of data corruption that
> seems to have been introduced by commit 00bfe02f4796 ("gfs2: Fix mmap +
> page fault deadlocks for buffered I/O"; merged in v5.16).  The
> corruption seems to occur in gfs2_file_buffered_write() when
> fault_in_iov_iter_readable() is involved.  We do end up with data that's
> written at an offset, as if after a fault-in, the position in the iocb
> got out of sync with the position in the iov_iter.  The user buffer the
> iov_iter points at isn't page aligned, so the corruption also isn't page
> aligned.  The code all seems correct and we couldn't figure out what's
> going on so far.

So this may be stupid, but looking at gfs2_file_direct_write(), I see
what looks like two different obvious bugs.

This looks entirely wrong:

        if (ret > 0)
                read = ret;

because this code is *repeated*.

I think it should use "read += ret;" so that if we have a few
successful reads, they add up.

And then at the end:

        if (ret < 0)
                return ret;
        return read;

looks wrong too, since maybe the *last* iteration failed, but an
earlier succeeded, so I think it should be

        if (read)
                return read;
        return ret;

But hey, what do I know. I say "looks like obvious bugs", but I don't
really know the code, and I may just be completely full of sh*t.

The reason I think I'm full of sh*t is that you say that the problem
occurs in gfs2_file_buffered_write(), not in that
gfs2_file_direct_write() case.

And the *buffered* case seems to get both of those "obvious bugs" right.

So I must be wrong, but I have to say, that looks odd to me.

Now hopefully somebody who knows the code will explain to me why I'm
wrong, and in the process go "Duh, but.." and see what's up.

                  Linus

