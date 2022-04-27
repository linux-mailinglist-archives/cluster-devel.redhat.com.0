Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E835123DE
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Apr 2022 22:27:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-P0xl7l8ZO1W7JLcskgsYsA-1; Wed, 27 Apr 2022 16:27:32 -0400
X-MC-Unique: P0xl7l8ZO1W7JLcskgsYsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 493608038E3;
	Wed, 27 Apr 2022 20:27:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3E3E2024CB6;
	Wed, 27 Apr 2022 20:27:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CE961947048;
	Wed, 27 Apr 2022 20:27:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F29E61947041 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Apr 2022 20:26:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B94D41121314; Wed, 27 Apr 2022 20:26:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 803FF111D7BA
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 20:26:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EE2C1C07381
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 20:26:18 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-U5zw75uUMZuyeaELx1U-mA-1; Wed, 27 Apr 2022 16:26:16 -0400
X-MC-Unique: U5zw75uUMZuyeaELx1U-mA-1
Received: by mail-lj1-f170.google.com with SMTP id 17so4196858lji.1
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 13:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbCA6ryLcC+4N1YdXeSNdc1G8PlnnlULw8ksimgMuYk=;
 b=S9VjhwuZUXnDexPB9NA1reFlNhq+dKbElBM9sMHmAOxbJEhaZkT94V7+bqVcx85Vzz
 9nz9uRANkF6K/2T/mQrGCoc8OOVWuGSc/L9LTgMrH1j0FhJ3xVizw2zboLhIYQsyRLPx
 fluWdzcCSvmeQq3dZWjdMVFy04WYm+zE845gRynyD9IqTt4CMgsuNMsQpzCZHS5mUQvR
 87iPH+3MAtMlFVhCmzct16ULQAVHsAm4qWswVtvoSFAInqfxirOLXSNDfQJDtElw4gmL
 M04iJ0XmacAbEGjUB5GXXFVcQI1+GdcUCaCuCQQcgL+BvjqaMo7mXatklJwwdURBOysQ
 W4Sw==
X-Gm-Message-State: AOAM530dQSiKyUnXEssvLkzzPXvIXi5+FrXtmVmREe4yojqab7PRsCQN
 yA+LKJrjrTh2Av+xhQpWNChFym1CgCaUiiY3OdE=
X-Google-Smtp-Source: ABdhPJxoPpjcZ90YZnykdHwzQZ0mMHjJjJysK4MBABrhi+5Ge8nAX9a0HuhpZNiyMN1w2rZK9lrAIg==
X-Received: by 2002:a2e:165c:0:b0:24f:8c7:d235 with SMTP id
 28-20020a2e165c000000b0024f08c7d235mr14327827ljw.449.1651091173521; 
 Wed, 27 Apr 2022 13:26:13 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05651202f000b0047220c85d92sm540079lfq.65.2022.04.27.13.26.12
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 13:26:12 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 16so4123441lju.13
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 13:26:12 -0700 (PDT)
X-Received: by 2002:a2e:8789:0:b0:24f:124c:864a with SMTP id
 n9-20020a2e8789000000b0024f124c864amr10737718lji.164.1651091172382; Wed, 27
 Apr 2022 13:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
 <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
In-Reply-To: <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Apr 2022 13:25:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
Message-ID: <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 12:41 PM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> I wonder if this could be documented in the read and write manual
> pages. Or would that be asking too much?

I don't think it would be asking too much, since it's basically just
describing what Linux has always done in all the major filesystems.

Eg look at filemap_read(), which is basically the canonical read
function, and note how it doesn't take a single lock at that level.

We *do* have synchronization at a page level, though, ie we've always
had that page-level "uptodate" bit, of course (ok, so "always" isn't
true - back in the distant past it was the 'struct buffer_head' that
was the synchronization point).

That said, even that is not synchronizing against "new writes", but
only against "new creations" (which may, of course, be writers, but is
equally likely to be just reading the contents from disk).

That said:

 (a) different filesystems can and will do different things.

Not all filesystems use filemap_read() at all, and even the ones that
do often have their own wrappers. Such wrappers *can* do extra
serialization, and have their own rules. But ext4 does not, for
example (see ext4_file_read_iter()).

And as mentioned, I *think* XFS honors that old POSIX rule for
historical reasons.

 (b) we do have *different* locking

for example, we these days do actually serialize properly on the
file->f_pos, which means that a certain *class* of read/write things
are atomic wrt each other, because we actually hold that f_pos lock
over the whole operation and so if you do file reads and writes using
the same file descriptor, they'll be disjoint.

That, btw, hasn't always been true. If you had multiple threads using
the same file pointer, I think we used to get basically random
results. So we have actually strengthened our locking in this area,
and made it much better.

But note how even if you have the same file descriptor open, and then
do pread/pwrite, those can and will happen concurrently.

And mmap accesses and modifications are obviously *always* concurrent,
even if the fault itself - but not the accesses - might end up being
serialized due to some filesystem locking implementation detail.

End result: the exact serialization is complex, depends on the
filesystem, and is just not really something that should be described
or even relied on (eg that f_pos serialization is something we do
properly now, but didn't necessarily do in the past, so ..)

Is it then worth pointing out one odd POSIX rule that basically nobody
but some very low-level filesystem people have ever heard about, and
that no version of Linux has ever conformed to in the main default
filesystems, and that no user has ever cared about?

             Linus

