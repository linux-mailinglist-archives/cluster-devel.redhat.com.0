Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C4518A39
	for <lists+cluster-devel@lfdr.de>; Tue,  3 May 2022 18:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651596115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pahes7C/tmc6/DL1WldFW1GN6sPT/c4aOjyuB4GyOjo=;
	b=Xq/QrKx5WsuUpox/YHWTpJWy0ipmsXI6X7yaegvxcu6gI4izmlJHVtK+CBCxsWxUO94nCq
	D7oVi9T0J7qf5oVVc7KAUELh/M/jDuEkrxZxDKX6fbVzAiQffSrTONNBcKVnk18gxjsCbG
	KhPWMCpyFWvn150mwl6xKBDmSM56T5g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-9JbUoCuUMvSVQcN5BxRliQ-1; Tue, 03 May 2022 12:41:46 -0400
X-MC-Unique: 9JbUoCuUMvSVQcN5BxRliQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0ADB3806705;
	Tue,  3 May 2022 16:41:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 987082026609;
	Tue,  3 May 2022 16:41:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C7D01947054;
	Tue,  3 May 2022 16:41:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C15021947043 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  3 May 2022 16:41:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9862E463E16; Tue,  3 May 2022 16:41:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A63463DEA
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 16:41:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BC1686B8B7
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 16:41:41 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-0W1jvMsgOF20A5lGbypTTA-1; Tue, 03 May 2022 12:41:30 -0400
X-MC-Unique: 0W1jvMsgOF20A5lGbypTTA-1
Received: by mail-wr1-f69.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso6520856wrh.18
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 09:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pahes7C/tmc6/DL1WldFW1GN6sPT/c4aOjyuB4GyOjo=;
 b=MktFkMbsTwMX1d8W3k2ynd2vP1EXNSnSULL3Ddj7J954pnXt6xj2H1IhpT9lKBLqQq
 MEw7IpQmfsAQV/t/Yfnxo2ysie5i9uQ7sRHBuRwTHl0BLYoJVDs8kaQ+69He7gwPKD6U
 7C/IAf5fmX4fmCFo0evqn5n5t42bppOwLyY3zkW7prBi5r9wjq6kxWCdoL1ZCgalZcDO
 w6x3QsJO70XHUXQOHKdfMRL2vGFkmLnQmxu08U0Yn4ufcdLOP+u0WKSBYLJ02In/wwt/
 QSC4rGpbOhAWj4SoCPIR6bpC3/uxhKgSMNHXOJlU85hS1qZ17AUUa+syOAzz0W5cko3M
 Aimg==
X-Gm-Message-State: AOAM533Eo+t9sc4zlUpAlYZH1UXUzojhxzC9Rqvpm0A78O0E5Clya2Iu
 PsE4XyH1kVkY8VcZ7t/3kUeSWCcM5hr1aS/T7F0XBuezEA3QC0kaKw8lqjRN+ExrLnHxlBm+sYW
 BWJM1SJQzmLjDMtJ9KPcHiGfA7tPerXSB5t1Yiw==
X-Received: by 2002:a05:6000:1848:b0:20c:713b:8e1e with SMTP id
 c8-20020a056000184800b0020c713b8e1emr4687685wri.640.1651596088857; 
 Tue, 03 May 2022 09:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxlxZdFgCAiHMVbSw5lczeYImaUCvF2aHBlyYw8A/WTq0Zy6Np8DioP/9GtXIjN4YifBEpw2oAXSUJWziXL2w=
X-Received: by 2002:a05:6000:1848:b0:20c:713b:8e1e with SMTP id
 c8-20020a056000184800b0020c713b8e1emr4687668wri.640.1651596088626; Tue, 03
 May 2022 09:41:28 -0700 (PDT)
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
 <CAHk-=whfP+m6--NtUeOm5XTuhBGHkyoqd00ypW6v3RkzMFLU8g@mail.gmail.com>
In-Reply-To: <CAHk-=whfP+m6--NtUeOm5XTuhBGHkyoqd00ypW6v3RkzMFLU8g@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 3 May 2022 18:41:17 +0200
Message-ID: <CAHc6FU4JeMHUrJbbTwEsMiPPyinQpX9fW-hz21GdjgVsvYRZkw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, May 3, 2022 at 6:19 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, May 3, 2022 at 1:56 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > We still get data corruption with the patch applied. The
> > WARN_ON_ONCE(!bytes) doesn't trigger.
>
> Oh well. I was so sure that I'd finally found something.. That partial
> write case has had bugs before.
>
> > As an additional experiment, I've added code to check the iterator
> > position that iomap_file_buffered_write() returns, and it's all
> > looking good as well: an iov_iter_advance(orig_from, written) from the
> > original position always gets us to the same iterator.
>
> Yeah, I've looked at the iterator parts (and iov_iter_revert() in
> particular) multiple times, because that too is an area where we've
> had bugs before.
>
> That too may be easy to get wrong, but I couldn't for the life of me
> see any issues there.
>
> > This points at gfs2 getting things wrong after a short write, for
> > example, marking a page / folio uptodate that isn't. But the uptodate
> > handling happens at the iomap layer, so this doesn't leave me with an
> > immediate suspect.
>
> Yeah, the uptodate setting looked safe, particularly with that "if we
> copied less than we thought we would, and it wasn't uptodate, just
> claim we didn't do anything at all".
>
> That said, I now have a *new* suspect: the 'iter->pos' handling in
> iomap_write_iter().
>
> In particular, let's look at iomap_file_buffered_write(), which does:
>
>         while ((ret = iomap_iter(&iter, ops)) > 0)
>                 iter.processed = iomap_write_iter(&iter, i);
>
> and then look at what happens to iter.pos here.
>
> iomap_write_iter() does this:
>
>         loff_t pos = iter->pos;
>         ...
>                 pos += status;
>
> but it never seems to write the updated position back to the iterator.
>
> So what happens next time iomap_write_iter() gets called?
>
> This looks like such a huge bug that I'm probably missing something,
> but I wonder if this is normally hidden by the fact that usually
> iomap_write_iter() consumes the whole 'iter', so despite the 'while()'
> loop, it's actually effectively only called once.
>
> Except if it gets a short write due to an unhandled page fault..
>
> Am I entirely blind, and that 'iter.pos' is updated somewhere and I
> just missed it?

That's happening in iomap_file_buffered_write() and iomap_iter():

        while ((ret = iomap_iter(&iter, ops)) > 0)
                iter.processed = iomap_write_iter(&iter, i);

Here, iomap_write_iter() returns how much progress it has made, which
is stored in iter.processed, and iomap_iter() -> iomap_iter_advance()
then updates iter.pos and iter.len based on iter.processed.

Andreas

