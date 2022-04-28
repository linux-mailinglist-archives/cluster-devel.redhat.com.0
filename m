Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCF513AB9
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 19:18:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-caQwGvALMcKdkypQxsMS1A-1; Thu, 28 Apr 2022 13:17:56 -0400
X-MC-Unique: caQwGvALMcKdkypQxsMS1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58F7F29ABA25;
	Thu, 28 Apr 2022 17:17:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A8051121319;
	Thu, 28 Apr 2022 17:17:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11EE91947048;
	Thu, 28 Apr 2022 17:17:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 40CC819466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Apr 2022 17:17:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 18B6640E7F15; Thu, 28 Apr 2022 17:17:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1424B40E7F06
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:17:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF3E3800882
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:17:52 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-ZbmbI2UZP9qWRkrenoe0Rw-1; Thu, 28 Apr 2022 13:17:50 -0400
X-MC-Unique: ZbmbI2UZP9qWRkrenoe0Rw-1
Received: by mail-lf1-f52.google.com with SMTP id bu29so9889060lfb.0
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 10:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RNIYBv55isrBKHu/0D73jjAPNihwP6eLiF1y+MnObN8=;
 b=pD4dNRpYL8ldGo4/8y0xlXHtSIgPGF6DG1gr5YPfA8LVsPe8VGHraJyI5Iv0CTcr7l
 V8xTsxdSYEI7B4LS8YCg+88lIuFyUIOXbIpuBbNYVOXY/IxiQXTrTagsKSylpaHHzt8z
 NByXPJxJJlqZSc+rtPkDnuum5rs5MT/rDkige9T1qjCSw3aW57ui96g7WwJeTnNG4uMd
 hC3YXnUlfGnfCjwitso7jnyFK9ONQ+F0O9T28xGSuGDKd9VC9P/xhezFV97AgtmyibiS
 nKW3zRn3h2elf551ZGgFYd7UeT4aYi0ZWBOltrM8m0ju+xi7TpyqpzLoMklVM1kcApZh
 RvuA==
X-Gm-Message-State: AOAM5319UtE+56FIoO21EF3j8NQCTnoNwwt1Q0StoNJpwJhCbtm/VrIm
 Ls1fyQllTRrf0WQu9ioydwDqN5vUcrOO6k7Vjvk=
X-Google-Smtp-Source: ABdhPJyNHvw9PLuVsoHzeDP4MWS5vQmJkZHGebbEa+S96J4m55hEURWgfmdUj9kY8C1han9qrodZAA==
X-Received: by 2002:a05:6512:3f97:b0:44a:f67d:7d8 with SMTP id
 x23-20020a0565123f9700b0044af67d07d8mr23944084lfa.81.1651166268599; 
 Thu, 28 Apr 2022 10:17:48 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 bi2-20020a0565120e8200b0044826a117bcsm51159lfb.44.2022.04.28.10.17.47
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 10:17:47 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 16so7540575lju.13
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 10:17:47 -0700 (PDT)
X-Received: by 2002:a2e:9d46:0:b0:24c:7f1d:73cc with SMTP id
 y6-20020a2e9d46000000b0024c7f1d73ccmr22272241ljj.358.1651166267188; Thu, 28
 Apr 2022 10:17:47 -0700 (PDT)
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
In-Reply-To: <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Apr 2022 10:17:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiF8D6Bs2m8y85XpHU__c4XD1yFV9JXx9FuTqoge+-yhg@mail.gmail.com>
Message-ID: <CAHk-=wiF8D6Bs2m8y85XpHU__c4XD1yFV9JXx9FuTqoge+-yhg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 10:09 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll look at that copy_page_to_iter_iovec() some more regardless, but
> doing that "let's double-check it's not somethign else" would be good.

Oh, and as I do that, it strikes me: What platform do you see the problem on?

Because the code for that function is very different if HIGHMEM is
enabled, so if you see this on x86-32 but not x86-64, for example,
that is relevant.

I *assume* nobody uses x86-32 any more, but just checking...

               Linus

