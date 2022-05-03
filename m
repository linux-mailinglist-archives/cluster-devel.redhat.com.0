Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BF5189EA
	for <lists+cluster-devel@lfdr.de>; Tue,  3 May 2022 18:28:57 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-FjjHTCwJPeKb8gnDPVsIdA-1; Tue, 03 May 2022 12:28:50 -0400
X-MC-Unique: FjjHTCwJPeKb8gnDPVsIdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D1B085A5BE;
	Tue,  3 May 2022 16:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E73E40D2820;
	Tue,  3 May 2022 16:28:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D75DE1947054;
	Tue,  3 May 2022 16:28:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F6091947043 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  3 May 2022 16:28:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED2341541C5E; Tue,  3 May 2022 16:28:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E93731541C5D
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 16:28:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A715E3C025BA
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 16:28:45 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-sR9kopVlMNOxoHe36GSplQ-1; Tue, 03 May 2022 12:28:25 -0400
X-MC-Unique: sR9kopVlMNOxoHe36GSplQ-1
Received: by mail-ed1-f48.google.com with SMTP id g20so20443466edw.6
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 09:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JG3HzoSawUya4Ff5hOskiwsDPqB8IOURZiJ3WxkT7I=;
 b=hEjTSSGeK9E1Dt8tmxYMka283Go7RDd59wOqOnbtNzr4m2W2wh0eAZgtdZdWO5zp84
 OM5qW4ZIf2j9yJEl9wD9cVSg6BDIx5TGRsKLw1I4mHRTNAsDP+ZWDXeauuLLkkDIb/9I
 VTOz6y2ESNQxXI0D60xcznSs3YdK7GZsH3Dg7tYdaB82Zgch/+ai8q6ETcZtv9nte3+t
 qTH+8WuUh8qNXcmzdnwDQfmJc4Dy2vU+WKWFZYPDwtbLvHK0aBRbMG/hkNo3QqKoGS8e
 LXSI97zhhQ2k1u2pUNiuwiRQdXat8s7eqbt2XUr/cwRDZfNAUu/NfOEmEmHUhfNy7aIn
 il3g==
X-Gm-Message-State: AOAM533f3ixvENocdYqTA87OzTPmfKtir4/FX4UJ6EEjTcA23dbggGKG
 Fk4iLYpxj/zCi5s6mApYYGp4ahpbowSL8O6G
X-Google-Smtp-Source: ABdhPJxRG4t/Aqj1Iz4U8/vniTF/LQs+pstUZ+lfp5tpElo7kTyStXJLreoWq0b0yEvNfRRp2pYviA==
X-Received: by 2002:a05:6512:2a92:b0:472:5c09:c1a8 with SMTP id
 dt18-20020a0565122a9200b004725c09c1a8mr9671032lfb.265.1651594782662; 
 Tue, 03 May 2022 09:19:42 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05651c124a00b0024f3d1daec0sm1407575ljh.72.2022.05.03.09.19.41
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:19:41 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 16so22629347lju.13
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 09:19:41 -0700 (PDT)
X-Received: by 2002:a2e:934b:0:b0:24f:cce:5501 with SMTP id
 m11-20020a2e934b000000b0024f0cce5501mr10518058ljh.443.1651594781101; Tue, 03
 May 2022 09:19:41 -0700 (PDT)
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
 <CAHc6FU77KGn76B4ieu9Tn895deK-1yV4y=8ou4gTfUf=7C-4XQ@mail.gmail.com>
In-Reply-To: <CAHc6FU77KGn76B4ieu9Tn895deK-1yV4y=8ou4gTfUf=7C-4XQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 May 2022 09:19:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfP+m6--NtUeOm5XTuhBGHkyoqd00ypW6v3RkzMFLU8g@mail.gmail.com>
Message-ID: <CAHk-=whfP+m6--NtUeOm5XTuhBGHkyoqd00ypW6v3RkzMFLU8g@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: "Darrick J. Wong" <djwong@kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, May 3, 2022 at 1:56 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> We still get data corruption with the patch applied. The
> WARN_ON_ONCE(!bytes) doesn't trigger.

Oh well. I was so sure that I'd finally found something.. That partial
write case has had bugs before.

> As an additional experiment, I've added code to check the iterator
> position that iomap_file_buffered_write() returns, and it's all
> looking good as well: an iov_iter_advance(orig_from, written) from the
> original position always gets us to the same iterator.

Yeah, I've looked at the iterator parts (and iov_iter_revert() in
particular) multiple times, because that too is an area where we've
had bugs before.

That too may be easy to get wrong, but I couldn't for the life of me
see any issues there.

> This points at gfs2 getting things wrong after a short write, for
> example, marking a page / folio uptodate that isn't. But the uptodate
> handling happens at the iomap layer, so this doesn't leave me with an
> immediate suspect.

Yeah, the uptodate setting looked safe, particularly with that "if we
copied less than we thought we would, and it wasn't uptodate, just
claim we didn't do anything at all".

That said, I now have a *new* suspect: the 'iter->pos' handling in
iomap_write_iter().

In particular, let's look at iomap_file_buffered_write(), which does:

        while ((ret = iomap_iter(&iter, ops)) > 0)
                iter.processed = iomap_write_iter(&iter, i);

and then look at what happens to iter.pos here.

iomap_write_iter() does this:

        loff_t pos = iter->pos;
        ...
                pos += status;

but it never seems to write the updated position back to the iterator.

So what happens next time iomap_write_iter() gets called?

This looks like such a huge bug that I'm probably missing something,
but I wonder if this is normally hidden by the fact that usually
iomap_write_iter() consumes the whole 'iter', so despite the 'while()'
loop, it's actually effectively only called once.

Except if it gets a short write due to an unhandled page fault..

Am I entirely blind, and that 'iter.pos' is updated somewhere and I
just missed it?

Or is this maybe the reason for it all?

                Linus

