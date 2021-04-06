Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 125673557C3
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 17:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617722911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lSAo36/1ny0ZeyecXydUwJvGLEfgkACXKOkRRqOOlIs=;
	b=PkM+WrXcjEFuTRik71c3aImxAPNAWuDbwBn3Pe2iQcqOBxZEGbBN1bj0uj49mNavVJcXKO
	zLthSUCmsseppUhFY/UBbDGoVVSDTREo+JQaMi+vEPcwlBGdwls+6IL3f4phTpiA+G2JYO
	s7C8K7MbghtUj67escAQGVuigm6+BNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-jvQbZ7eaMaCb5BHrxxSYbQ-1; Tue, 06 Apr 2021 11:28:28 -0400
X-MC-Unique: jvQbZ7eaMaCb5BHrxxSYbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10ACB1083E84;
	Tue,  6 Apr 2021 15:28:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6555D741;
	Tue,  6 Apr 2021 15:28:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99E324BB7C;
	Tue,  6 Apr 2021 15:28:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136FPMWQ023267 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 11:25:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3419D112CA37; Tue,  6 Apr 2021 15:25:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30D95112CA34
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 15:25:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03102811E93
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 15:25:19 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-340-9tGiZE1kO4-ddGbNkpFQkw-1; Tue, 06 Apr 2021 11:25:17 -0400
X-MC-Unique: 9tGiZE1kO4-ddGbNkpFQkw-1
Received: by mail-wr1-f69.google.com with SMTP id 75so10074476wrl.3
	for <cluster-devel@redhat.com>; Tue, 06 Apr 2021 08:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lSAo36/1ny0ZeyecXydUwJvGLEfgkACXKOkRRqOOlIs=;
	b=J0A+7TAuWl+3YZ9AG8M53XKV4pAUXeuKZ9KVxHGDvcvbEhZSaqaXZu5KBAQLKiCNOv
	Ozk63XQqJtrPxsfASm6A0jtX+xs/CtGMXLgR2m+k8T+d4Oz2MARlojFDCNhha4PaPqi9
	mxPLL/sxvfqJmuDT2yqiNqDdEVs2o9pmM4dvD2c5Vu7e3iZKNX0ALeiMJ2aREldcJYdV
	pQtfogQIcVLVZPxNDIVm31NAIKDyL0s8rPjDtLbFCbfhyhsGgLOL28CqTPJbih311KsE
	A86b+K7KAC/SlXoLxz7EhtrxWDucfa0QC+TluYIzLN+seXr9OFlT7inIwBi5oYB3IGfJ
	SqYg==
X-Gm-Message-State: AOAM533Aoc2PHCZ3DR9g9NCPvnFHsMVcMBL6yTehD6JEnqsNNGnynakY
	PfXCm6Yo4pQqp8NkmQjnMUsZNMWwHutHZnQmoErLQyF5GuG4hQzdlglFREBbgqBLx/7qBlfqdYo
	aCKcp1BrVMIjey/K4cMlM+BJynkg5JjFyrquRuw==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr1294701wmj.2.1617722715767;
	Tue, 06 Apr 2021 08:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlOd1yJee2I0h1TAL1N1Y+IENhg3EmupdGYdLKQVOFjDT6LJKOBL4hx0sj32YWbQy7zvuXs82K+ziu7QBjB4M=
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr1294690wmj.2.1617722715620;
	Tue, 06 Apr 2021 08:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210326091151.311647-1-lee.jones@linaro.org>
	<20210406091126.GT2916463@dell>
	<468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
	<052f97ad-5fd3-e4f8-6339-bacaf0d8fd77@schindlerman.de>
In-Reply-To: <052f97ad-5fd3-e4f8-6339-bacaf0d8fd77@schindlerman.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 6 Apr 2021 17:25:04 +0200
Message-ID: <CAHc6FU4J01ATJ7fA5OXRrxkfAWQELKcru+DmVW6D95Us_185wQ@mail.gmail.com>
To: andreas.schindler@schindlerman.de
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Unsubscribe from list
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Apr 6, 2021 at 4:11 PM Andreas Schindler
<andreas.schindler@schindlerman.de> wrote:
> Please unsubscribe my email address or give me a link where i can do it on my own.see the headers of any email from the list:

see the headers of any mail delivered to you via the list:

List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>

Regards,
Andreas

