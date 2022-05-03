Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BF4518043
	for <lists+cluster-devel@lfdr.de>; Tue,  3 May 2022 10:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651568205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hsMPfZ7YVBXiceEKvCyPHJHbSrWBVzhicBQJ3xEfcUM=;
	b=TLVe3Dry0YIQd6jiB9T0uRNTGPo8iw1XE3ZvKMEcQLoqFFDBNaj+p87lElII4uOQHSNA6l
	niRNr5hSVVT2zbGrgyCnHA9b3WytOXMLXZvwcLEBEzfPoqTLxxU5O+SM5qsWQzn67U7F6B
	i+GxmiLtV8tnhlej9+7v8c3U//hehDo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-xpxME_WcMB-ajQHKLG0F6w-1; Tue, 03 May 2022 04:56:42 -0400
X-MC-Unique: xpxME_WcMB-ajQHKLG0F6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CE17811E78;
	Tue,  3 May 2022 08:56:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4033D401E77;
	Tue,  3 May 2022 08:56:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7AE31947049;
	Tue,  3 May 2022 08:56:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9C701947041 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  3 May 2022 08:56:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98439568CD4; Tue,  3 May 2022 08:56:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94359568CD2
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 08:56:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ADF71014A60
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 08:56:37 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-fFKHrP8IOB292wFmFQUzhw-1; Tue, 03 May 2022 04:56:33 -0400
X-MC-Unique: fFKHrP8IOB292wFmFQUzhw-1
Received: by mail-wm1-f70.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so499160wmj.5
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 01:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hsMPfZ7YVBXiceEKvCyPHJHbSrWBVzhicBQJ3xEfcUM=;
 b=jQhtLntlJF3ZJpa0w7UnX7TqNxqfdIx02Da3gGK8LA2kfpWwVlAh6nUbcUh9MvTH5r
 KKzFHAoWcXAyLCnDYtdlHqedF0xHcDphMZMvD58JCJgBzG7M58q3XIE+mP6B/y115fS0
 ckZQmugPoW8Mj6Qaa7CvqUfQJ9afy2F7EySS8Qs87yi0xFRkBOmY38OPbpQjK/BkwLM2
 DyzMy3z7U+oOzHNRWqNtgVphjUqJSLyL435o/jXBnVQxh4f4VwXvreebulgb+Qq+pSvu
 N+V31jva7UolLjj6TOwCo7n9Q568kVyOdABK5YD8RDgjTa17bRIu1YeZs1DDcubqdf2c
 nhOg==
X-Gm-Message-State: AOAM532oCh26ptY0MQd/SJnueCECMociYdwYTjnk06x4La18wKNMIAEc
 kGeBv79kL1gGyssnxFO0WZM86m6/F3U4MjTjFBQOJSwmIKXXKysLTh+NpPUze9At2vVtPMdWt7E
 RB+pMy6iF9mVPhjQBmHrHG07/dYxSoaxPE9GY0w==
X-Received: by 2002:a05:600c:9:b0:393:ea67:1c68 with SMTP id
 g9-20020a05600c000900b00393ea671c68mr2482283wmc.92.1651568192650; 
 Tue, 03 May 2022 01:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYtLR8VvhbzJcDjhUtSyg5TLLMizsYb225WJMv+RYxsAzrnZVWzwvB4t0FHDEztk89AxGCkD5/dkHUmR0hilI=
X-Received: by 2002:a05:600c:9:b0:393:ea67:1c68 with SMTP id
 g9-20020a05600c000900b00393ea671c68mr2482267wmc.92.1651568192413; Tue, 03 May
 2022 01:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
 <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
 <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
 <CAHc6FU69E4ke4Xg3zQ2MqjLbfM65D9ZajdY5MRDLN0azZOGmVQ@mail.gmail.com>
 <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
 <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
 <CAHc6FU7GkXLkns5PONLvsSi6HB+rjaNSyFeQFS034tKL-JueMw@mail.gmail.com>
 <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
 <CAHc6FU6VgQDO7HT5f4S_4f=9hczKGRDQ6SbQ5kNHMi4i-6rxVA@mail.gmail.com>
 <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
In-Reply-To: <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 3 May 2022 10:56:20 +0200
Message-ID: <CAHc6FU77KGn76B4ieu9Tn895deK-1yV4y=8ou4gTfUf=7C-4XQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: "Darrick J. Wong" <djwong@kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 8:32 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Apr 28, 2022 at 10:39 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Yes, but note that it's gfs2_file_buffered_write() that fails. When
> > the pagefault_disable/enable() around iomap_file_buffered_write() is
> > removed, the corruption goes away.
>
> I looked some more at this on and off, and ended up even more confused.
>
> For some reason, I'd mostly looked at the read case, because I had
> mis-read some of your emails and thought it was the buffered reads
> that caused problems.
>
> Then I went back more carefully, and realized you had always said
> gfs2_file_buffered_write() was where the issues happened, and looked
> at that path more, and that confused me even *MORE*.
>
> Because that case has always done the copy from user space with page
> faults disabled, because of the traditional deadlock with reading from
> user space while holding the page lock on the target page cache page.
>
> So that is not really about the new deadlock with filesystem locks,
> that was fixed by 00bfe02f4796 ("gfs2: Fix mmap + page fault deadlocks
> for buffered I/O").
>
> So now that I'm looking at the right function (maybe) I'm going "huh",
> because it's none of the complex cases that would seem to fail, it's
> literally just the fault_in_iov_iter_readable() that we've always done
> in iomap_write_iter() that presumably starts failing.
>
> But *that* old code seems bogus too. It's doing
>
>                 if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {
>                         status = -EFAULT;
>                         break;
>                 }
>
> which on the face of it is sane: it's saying "if we can't fault in any
> bytes, then stop trying".
>
> And it's good, and correct, but it does leave one case open.
>
> Because what if the result is "we can fault things in _partially_"?
>
> The code blithely goes on and tries to do the whole 'bytes' range _anyway_.
>
> Now, with a bug-free filesystem, this really shouldn't matter, since
> the later copy_page_from_iter_atomic() thing should then DTRT anyway,
> but this does mean that one fundamental thing that that commit
> 00bfe02f4796 changed is that it basically disabled that
> fault_in_iov_iter_readable() that *used* to fault in the whole range,
> and now potentially only faults in a small area.
>
> That, in turn, means that in practice it *used* to do "write_end()"
> with a fully successful range, ie when it did that
>
>                 status = a_ops->write_end(file, mapping, pos, bytes, copied,
>                                                 page, fsdata);
>
> then "bytes" and "copied" were the same.
>
> But now that commit 00bfe02f4796 added the "disable_pagefault()"
> around the whole thing, fault_in_iov_iter_readable() will easily fail
> half-way instead of bringing the next page in, and then that
> ->write_begin() to ->write_end() sequence will see the copy in the
> middle failing half-way too, and you'll have that write_end()
> condition with the write _partially_ succeeding.
>
> Which is the complex case for write_end() that you practically
> speaking never saw before (it *could* happen with a race with swap-out
> or similar, but it was not really something you could trigger in real
> life.
>
> And I suspect this is what bites you with gfs2
>
> To *test* that hypothesis, how about you try this attached patch? The
> generic_perform_write() function in mm/filemap.c has the same exact
> pattern, but as mentioned, a filesystem really needs to be able to
> handle the partial write_end() case, so it's not a *bug* in that code,
> but it migth be triggering a bug in gfs2.
>
> And gfs2 only uses the iomap_write_iter() case, I think. So that's the
> only case this attached patch changes.
>
> Again - I think the unpatched iomap_write_iter() code is fine, but I
> think it may be what then triggers the real bug in gfs2. So this patch
> is not wrong per se, but this patch is basically a "hide the problem"
> patch, and it would be very interesting to hear if it does indeed fix
> your test-case.

We still get data corruption with the patch applied. The
WARN_ON_ONCE(!bytes) doesn't trigger.

As an additional experiment, I've added code to check the iterator
position that iomap_file_buffered_write() returns, and it's all
looking good as well: an iov_iter_advance(orig_from, written) from the
original position always gets us to the same iterator.

This points at gfs2 getting things wrong after a short write, for
example, marking a page / folio uptodate that isn't. But the uptodate
handling happens at the iomap layer, so this doesn't leave me with an
immediate suspect.

We're on filesystems with block size == page size, so none of the
struct iomap_page uptodata handling should be involved, either.

> Because that would pinpoint exactly what the bug is.
>
> I'm adding Christoph and Darrick as iomap maintainers here to the
> participants (and Dave Chinner in case he's also the temporary
> maintainer because Darrick is doing reviews) not because they
> necessarily care, but just because this test-patch obviously involves
> the iomap code.
>
> NOTE! This patch is entirely untested. I also didn't actually yet go
> look at what gfs2 does when 'bytes' and 'copied' are different. But
> since I finally think I figured out what might be going on, I decided
> I'd send this out sooner rather than later.
>
> Because this is the first thing that makes me go "Aaahh.. This might
> explain it".
>
>                    Linus

Thanks,
Andreas

