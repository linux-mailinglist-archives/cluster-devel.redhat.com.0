Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A66518A7A
	for <lists+cluster-devel@lfdr.de>; Tue,  3 May 2022 18:51:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-4leSdV_sPkekPkDAJxfA0A-1; Tue, 03 May 2022 12:51:51 -0400
X-MC-Unique: 4leSdV_sPkekPkDAJxfA0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16C811014A61;
	Tue,  3 May 2022 16:51:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA7004010E31;
	Tue,  3 May 2022 16:51:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 52BD61947054;
	Tue,  3 May 2022 16:51:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABDFA1947043 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  3 May 2022 16:51:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 501A640CFD19; Tue,  3 May 2022 16:51:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B737400DE5E
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 16:51:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 320BBD99F83
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 16:51:47 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-t9LJQvcBPByCsHn8JkYSgw-2; Tue, 03 May 2022 12:51:43 -0400
X-MC-Unique: t9LJQvcBPByCsHn8JkYSgw-2
Received: by mail-lf1-f47.google.com with SMTP id w19so31269749lfu.11
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 09:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQQ4M4gauRgvjGonaZz8I2LViquH62bNFXTFnYfFmTQ=;
 b=dXQdGVCPpxRJC2L/mlN7ZEzsTtprymVDuHySAywnh4PQe7eWDIzFSO2J4ukSZdL4JW
 Ojk4qKv8/xphEaTMZEqnMLi/dR93HrnXhPtiMd5FDRsz2KoqzO44d2i4g47lOsltbHMY
 m1z0DtLBLHlBrko8RJFwntcWmNKSul0UxHDnqDGlsFXK4bhMSTknqkJSgXefMWgK5FVU
 zYnQngV0/L6fn2bFgQlp4es/9rzNrugvmONRIJbif6HJcgPk9Yi01c4hEkrD840Myiec
 04D2+vIGw8ISx4swoVLqWP5XsCZCC2XRYGSTz+HJKbcEa7mVs97MXLD1zvaMopdp0WMY
 SGWg==
X-Gm-Message-State: AOAM531ekwWJNCZYTekUAj4YVpGm07xFoCkSGdT4vmEUS6mL0j8sQrOz
 IFHxrnlf3jzbHgK3RuwI+crjoNTgzXfR6k5d
X-Google-Smtp-Source: ABdhPJywkL1Nn8F/EhPGIygPTqN3tvMgdoB+Go4TU9mHXTIwOdHj4Gq2GR1QuZZ3meK9UyUExu54bQ==
X-Received: by 2002:a05:6512:3c8f:b0:473:9d3b:84 with SMTP id
 h15-20020a0565123c8f00b004739d3b0084mr6578613lfv.334.1651596703121; 
 Tue, 03 May 2022 09:51:43 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 x18-20020a2e9dd2000000b0024f275bb06asm1387369ljj.3.2022.05.03.09.50.45
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:51:09 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id bu29so31367650lfb.0
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 09:50:45 -0700 (PDT)
X-Received: by 2002:a05:6512:6cb:b0:472:5e24:de05 with SMTP id
 u11-20020a05651206cb00b004725e24de05mr9332378lff.542.1651596636487; Tue, 03
 May 2022 09:50:36 -0700 (PDT)
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
 <CAHc6FU4JeMHUrJbbTwEsMiPPyinQpX9fW-hz21GdjgVsvYRZkw@mail.gmail.com>
In-Reply-To: <CAHc6FU4JeMHUrJbbTwEsMiPPyinQpX9fW-hz21GdjgVsvYRZkw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 May 2022 09:50:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipNXcy2qRF5d+oqO-LN+bR7Bmz+Vtvcapo_WigOzLirA@mail.gmail.com>
Message-ID: <CAHk-=wipNXcy2qRF5d+oqO-LN+bR7Bmz+Vtvcapo_WigOzLirA@mail.gmail.com>
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

On Tue, May 3, 2022 at 9:41 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> That's happening in iomap_file_buffered_write() and iomap_iter():
>
>         while ((ret = iomap_iter(&iter, ops)) > 0)
>                 iter.processed = iomap_write_iter(&iter, i);
>
> Here, iomap_write_iter() returns how much progress it has made, which
> is stored in iter.processed, and iomap_iter() -> iomap_iter_advance()
> then updates iter.pos and iter.len based on iter.processed.

Ahh. I even had that file open in my editor in another window, but missed it.

So much for that theory.

              Linus

