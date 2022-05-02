Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E9517691
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 20:32:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-1O4w9VRCOf6PNRkIFwowKQ-1; Mon, 02 May 2022 14:32:33 -0400
X-MC-Unique: 1O4w9VRCOf6PNRkIFwowKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E5458015BA;
	Mon,  2 May 2022 18:32:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 462AF150964A;
	Mon,  2 May 2022 18:32:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B2DF1947054;
	Mon,  2 May 2022 18:32:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7CDBD1947042 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 18:32:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0BB57C52C87; Mon,  2 May 2022 18:32:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07360C52C86
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 18:32:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7851429ABA01
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 18:32:22 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-teYYGGaPOaqMBpS1vkwsBw-1; Mon, 02 May 2022 14:32:20 -0400
X-MC-Unique: teYYGGaPOaqMBpS1vkwsBw-1
Received: by mail-lf1-f51.google.com with SMTP id w1so26706772lfa.4
 for <cluster-devel@redhat.com>; Mon, 02 May 2022 11:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TExx3LHdScpDYiBZLipOD0qdfGO/2GznrveBrUCOCs=;
 b=HRpMF3lVqBI2yoqE1klNc6fBeSuZrdxGczwIQmLYZMyrRby404j3nTmYmyyExUmlEz
 Z8IRv0KYvrY1vyedWnReo6ZOPO2Zs7Xl2sRGdawmfJaVQJlq5QSIN61QSWb/U0VsqQQh
 HXpISM8OiuCa0Q/dCsSzWvdEK0e+DlgLEMgCX5KkFoVg5mHcfttHrvfORNzz6LWIAQhB
 9dD7qbED++2BuJikdkAn5kWPgQNJNVyIn6FSgEsFYEtizFXdRrvMjaqtdutfbHEiwlUl
 7Qj5eJxuTwGR1NlCtCsrhipwWPhVlhrmQ30h1yo1XtKI05gB5+W0CerfOJ1JH24u8Lp8
 eZ+Q==
X-Gm-Message-State: AOAM532XowYtUSXPOlCv2C1WZ4U9wuSJmg2wSLHncPH/L7rwmjYUymf3
 dnF4AmL23L5j8VqlCuNhEZPSZnKXephYwT7w
X-Google-Smtp-Source: ABdhPJxlwrYqJ6X6E30CsvvAMpSUVpQNnrXmEiyyp6dtBUXUnZ8JGOJeatntB89XcbMGRVEhgc3YPA==
X-Received: by 2002:a05:6512:2286:b0:471:d055:887d with SMTP id
 f6-20020a056512228600b00471d055887dmr9343470lfu.413.1651516338079; 
 Mon, 02 May 2022 11:32:18 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05651204cd00b0047255d211easm765616lfq.281.2022.05.02.11.32.15
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 11:32:16 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id x33so26758489lfu.1
 for <cluster-devel@redhat.com>; Mon, 02 May 2022 11:32:15 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr9537978lfh.687.1651516335359; Mon, 02
 May 2022 11:32:15 -0700 (PDT)
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
In-Reply-To: <CAHc6FU6VgQDO7HT5f4S_4f=9hczKGRDQ6SbQ5kNHMi4i-6rxVA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 May 2022 11:31:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
Message-ID: <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, 
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <dchinner@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="00000000000082fc6805de0b9c04"

--00000000000082fc6805de0b9c04
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 10:39 AM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> Yes, but note that it's gfs2_file_buffered_write() that fails. When
> the pagefault_disable/enable() around iomap_file_buffered_write() is
> removed, the corruption goes away.

I looked some more at this on and off, and ended up even more confused.

For some reason, I'd mostly looked at the read case, because I had
mis-read some of your emails and thought it was the buffered reads
that caused problems.

Then I went back more carefully, and realized you had always said
gfs2_file_buffered_write() was where the issues happened, and looked
at that path more, and that confused me even *MORE*.

Because that case has always done the copy from user space with page
faults disabled, because of the traditional deadlock with reading from
user space while holding the page lock on the target page cache page.

So that is not really about the new deadlock with filesystem locks,
that was fixed by 00bfe02f4796 ("gfs2: Fix mmap + page fault deadlocks
for buffered I/O").

So now that I'm looking at the right function (maybe) I'm going "huh",
because it's none of the complex cases that would seem to fail, it's
literally just the fault_in_iov_iter_readable() that we've always done
in iomap_write_iter() that presumably starts failing.

But *that* old code seems bogus too. It's doing

                if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {
                        status = -EFAULT;
                        break;
                }

which on the face of it is sane: it's saying "if we can't fault in any
bytes, then stop trying".

And it's good, and correct, but it does leave one case open.

Because what if the result is "we can fault things in _partially_"?

The code blithely goes on and tries to do the whole 'bytes' range _anyway_.

Now, with a bug-free filesystem, this really shouldn't matter, since
the later copy_page_from_iter_atomic() thing should then DTRT anyway,
but this does mean that one fundamental thing that that commit
00bfe02f4796 changed is that it basically disabled that
fault_in_iov_iter_readable() that *used* to fault in the whole range,
and now potentially only faults in a small area.

That, in turn, means that in practice it *used* to do "write_end()"
with a fully successful range, ie when it did that

                status = a_ops->write_end(file, mapping, pos, bytes, copied,
                                                page, fsdata);

then "bytes" and "copied" were the same.

But now that commit 00bfe02f4796 added the "disable_pagefault()"
around the whole thing, fault_in_iov_iter_readable() will easily fail
half-way instead of bringing the next page in, and then that
->write_begin() to ->write_end() sequence will see the copy in the
middle failing half-way too, and you'll have that write_end()
condition with the write _partially_ succeeding.

Which is the complex case for write_end() that you practically
speaking never saw before (it *could* happen with a race with swap-out
or similar, but it was not really something you could trigger in real
life.

And I suspect this is what bites you with gfs2

To *test* that hypothesis, how about you try this attached patch? The
generic_perform_write() function in mm/filemap.c has the same exact
pattern, but as mentioned, a filesystem really needs to be able to
handle the partial write_end() case, so it's not a *bug* in that code,
but it migth be triggering a bug in gfs2.

And gfs2 only uses the iomap_write_iter() case, I think. So that's the
only case this attached patch changes.

Again - I think the unpatched iomap_write_iter() code is fine, but I
think it may be what then triggers the real bug in gfs2. So this patch
is not wrong per se, but this patch is basically a "hide the problem"
patch, and it would be very interesting to hear if it does indeed fix
your test-case.

Because that would pinpoint exactly what the bug is.

I'm adding Christoph and Darrick as iomap maintainers here to the
participants (and Dave Chinner in case he's also the temporary
maintainer because Darrick is doing reviews) not because they
necessarily care, but just because this test-patch obviously involves
the iomap code.

NOTE! This patch is entirely untested. I also didn't actually yet go
look at what gfs2 does when 'bytes' and 'copied' are different. But
since I finally think I figured out what might be going on, I decided
I'd send this out sooner rather than later.

Because this is the first thing that makes me go "Aaahh.. This might
explain it".

                   Linus

--00000000000082fc6805de0b9c04
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l2p2606f0>
X-Attachment-Id: f_l2p2606f0

IGZzL2lvbWFwL2J1ZmZlcmVkLWlvLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL2lvbWFwL2J1ZmZl
cmVkLWlvLmMgYi9mcy9pb21hcC9idWZmZXJlZC1pby5jCmluZGV4IDhjZTg3MjAwOTNiOS4uZWIx
OTczNzkyYzY4IDEwMDY0NAotLS0gYS9mcy9pb21hcC9idWZmZXJlZC1pby5jCisrKyBiL2ZzL2lv
bWFwL2J1ZmZlcmVkLWlvLmMKQEAgLTc1OCwxMyArNzU4LDIwIEBAIHN0YXRpYyBsb2ZmX3QgaW9t
YXBfd3JpdGVfaXRlcihzdHJ1Y3QgaW9tYXBfaXRlciAqaXRlciwgc3RydWN0IGlvdl9pdGVyICpp
KQogCQlpZiAoYnl0ZXMgPiBsZW5ndGgpCiAJCQlieXRlcyA9IGxlbmd0aDsKIAorCQkvKiBOb2Jv
ZHkgX3Nob3VsZF8gY2FsbCB1cyB3aXRoIGFuIGVtcHR5IGl0ZXIsIGJ1dC4uICovCisJCWlmIChX
QVJOX09OX09OQ0UoIWJ5dGVzKSkgeworCQkJc3RhdHVzID0gMDsKKwkJCWJyZWFrOworCQl9CisK
IAkJLyoKIAkJICogQnJpbmcgaW4gdGhlIHVzZXIgcGFnZSB0aGF0IHdlJ2xsIGNvcHkgZnJvbSBf
Zmlyc3RfLgogCQkgKiBPdGhlcndpc2UgdGhlcmUncyBhIG5hc3R5IGRlYWRsb2NrIG9uIGNvcHlp
bmcgZnJvbSB0aGUKIAkJICogc2FtZSBwYWdlIGFzIHdlJ3JlIHdyaXRpbmcgdG8sIHdpdGhvdXQg
aXQgYmVpbmcgbWFya2VkCiAJCSAqIHVwLXRvLWRhdGUuCiAJCSAqLwotCQlpZiAodW5saWtlbHko
ZmF1bHRfaW5faW92X2l0ZXJfcmVhZGFibGUoaSwgYnl0ZXMpID09IGJ5dGVzKSkgeworCQlieXRl
cyAtPSBmYXVsdF9pbl9pb3ZfaXRlcl9yZWFkYWJsZShpLCBieXRlcyk7CisJCWlmICh1bmxpa2Vs
eSghYnl0ZXMpKSB7CiAJCQlzdGF0dXMgPSAtRUZBVUxUOwogCQkJYnJlYWs7CiAJCX0K
--00000000000082fc6805de0b9c04--

