Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A18AE364AA4
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618860960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qhCBB/erSF84NjyOr93Erqpda+KQlNAQx+NxNP0oQ2Y=;
	b=Z0APNH+t9BXKcaPHpLVabIHooz/o75tO+x80r7YKL7te9cIRw3iS7VCrXwMyXC1mqsgxdU
	f/RsYXmaiAf8sA4DoBqTvpQdUEwySZt6P3wFiTStnP9d7DugM/ir++bBUBy0KDh/Uso6m6
	4jTn1x6PvturEWCSWz5WUNNc3rxgbXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-cYOtgXsNMQeNqtrErtayPw-1; Mon, 19 Apr 2021 15:35:59 -0400
X-MC-Unique: cYOtgXsNMQeNqtrErtayPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861EB10054F6;
	Mon, 19 Apr 2021 19:35:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76EB92B0D7;
	Mon, 19 Apr 2021 19:35:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 656141806D17;
	Mon, 19 Apr 2021 19:35:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJZt3v002955 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:35:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0424205FAA0; Mon, 19 Apr 2021 19:35:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD602095BD5
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:35:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8197E81D9EA
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:35:52 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-107-_hQWp5oHNci6d9CR2eKzdA-1; Mon, 19 Apr 2021 15:35:50 -0400
X-MC-Unique: _hQWp5oHNci6d9CR2eKzdA-1
Received: by mail-wr1-f71.google.com with SMTP id
	93-20020adf80e60000b0290106fab45006so5028161wrl.20
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 12:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qhCBB/erSF84NjyOr93Erqpda+KQlNAQx+NxNP0oQ2Y=;
	b=On0YKo5vMELrjnU1K6W86T3xP0JjS4ckcVaGZUnEEfrOix8JaPuoQba3jL+4YCyQXW
	XyMZCq2sddJnj8uud0+Cqg+eQb/9dIrgtuX+RJA6uosQyXm1ZY6fNlNnh9cJAaktmlRi
	avV0TKYSlXj1qh/79k06HgcEoRVo35F6ch8WggZHerr8UAwQy2laEdXPsBFda/GEhNHM
	oq0W2VGy1rhbsO/epgAHHiFC5NL83IueXCjyR6kRqAvZ6epxjtado20KAu/JrTOwUebq
	PwTN0Fst/px3yA4CmHiQMQSQqmHtAWFUWPZ5jBFrpyfZdZZxDedXswkonzcE0W96O6TX
	Hc1g==
X-Gm-Message-State: AOAM530V3/ZDuB9DwNOhopEHT95uyXyrbGX+dqECGZG6dsN7bd1KDtf3
	BvJXekYSkm1dLuQG11FfVxoFZxv1qqlKdiJNMtwu8BB3Re4Wz43rV8rUOWjARZmo5vI5YNOyCeT
	culS9I3mHbjJg7kKFwKzBZPik94/JUOPOnvEg6A==
X-Received: by 2002:a05:600c:d4:: with SMTP id
	u20mr634804wmm.164.1618860949199; 
	Mon, 19 Apr 2021 12:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+PFLY66fVh3uWZlkGxRdOUNNd/lN9xEm8bwH4umvq+7/95bwjCfqkj0vWFVshDkls9Jz2EmESjMt6vPHDjZw=
X-Received: by 2002:a05:600c:d4:: with SMTP id
	u20mr634797wmm.164.1618860949106; 
	Mon, 19 Apr 2021 12:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210419191117.297653-1-anprice@redhat.com>
	<20210419191117.297653-2-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-2-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 19 Apr 2021 21:35:38 +0200
Message-ID: <CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 1/8] Import linux/gfs2_ondisk.h
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Andy,

On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
> diff --git a/gfs2/include/gfs2_ondisk.h b/gfs2/include/gfs2_ondisk.h
> new file mode 100644
> index 00000000..fc948f89
> --- /dev/null
> +++ b/gfs2/include/gfs2_ondisk.h

any reason why this file shouldn't be at gfs2/include/linux/gfs2_ondisk.h?

Thanks,
Andreas

