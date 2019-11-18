Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59B00100AE6
	for <lists+cluster-devel@lfdr.de>; Mon, 18 Nov 2019 18:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574099620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p9z/BZBwEPHMMUAB5PbkhIAsDf/fcQnWd/P0005BDrU=;
	b=OGJ8GsaD+X6/Hp8MG0DNZ1Zm4ktg+nEWDba4IOTfezFGtSEkRPLUhOznuFSmwmjRxSklLk
	xxheWFtZfq41LnhvrGDCOVitcjsY07OCoqwxVIiCO20Kh2vQNFFM+fXGX833+lFf7qoM6d
	5Pdi4V+ng/czkJTxOaeLewH0ip8d/wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-LOWk_7m5NI6kw4LIL4HU1Q-1; Mon, 18 Nov 2019 12:53:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7B791883522;
	Mon, 18 Nov 2019 17:53:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A627060D0B;
	Mon, 18 Nov 2019 17:53:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12E801802026;
	Mon, 18 Nov 2019 17:53:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAIHrXkx027446 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 18 Nov 2019 12:53:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07919518B; Mon, 18 Nov 2019 17:53:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B7476F2
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 17:53:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED337185A79C
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 17:53:30 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-d2UeImxmMJizW8VV09RQ9A-1; Mon, 18 Nov 2019 12:53:27 -0500
Received: by mail-oi1-f199.google.com with SMTP id n30so9111181oij.9
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 09:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p9z/BZBwEPHMMUAB5PbkhIAsDf/fcQnWd/P0005BDrU=;
	b=IR4XQVRnHAVqwc5eMx3nUmO0lwWECKy5szzlHCnHo+Xuv6ZvBumWPXItcQuEVaD4/X
	t/L+w5UZjSVO6AZ3DYOTcwUVyyRtrwSxibWP/g6ZfLaJ0i9ljPcGJdTllqtj/pmmQU7a
	vuK96ir9XUH+hPu66xVt5WGoviYyoyf4vlDzrA0nB0vS4vnTeEhGalvrD/udqE7aorf0
	inhE8sAoRP5M4OWFstZYgJOThAv+Psfq4g4zNxUSa7JkpeVxL1/2cUrTCj7BahRtw3WJ
	tbIyC2c1MwQmdrLGPjRA/956HSEHhZzCZekvbeBPZr5x716wr10fRfamTCq628v7OriB
	kqXQ==
X-Gm-Message-State: APjAAAVBjZlPNALxM+78sZ/Fkpk+S0A+b3OHGXWFZQyj2gn41eZupuSr
	JteIwI+BGhefbn8N5E959vyLDMJ9NrcHk2ADCZT6RrCd7CFf745C3rvzxfYW3Q25DypUNZS+D/2
	zrYO5RU7uk85WZH3FxdJjt8B7yvnGqNn2f56YVg==
X-Received: by 2002:a9d:191e:: with SMTP id j30mr345581ota.297.1574099606704; 
	Mon, 18 Nov 2019 09:53:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxisRg1WAbOC2UBXB5sSL+P033cD+/7sOsAFKTMxIw3bJPLlwNm7MWajt84D16t3SqQXMISrTJvTXSnWyrstHA=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr345578ota.297.1574099606569; 
	Mon, 18 Nov 2019 09:53:26 -0800 (PST)
MIME-Version: 1.0
References: <1660556917.30232558.1573828656613.JavaMail.zimbra@redhat.com>
	<1617710442.30232713.1573828753028.JavaMail.zimbra@redhat.com>
In-Reply-To: <1617710442.30232713.1573828753028.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 18 Nov 2019 18:53:15 +0100
Message-ID: <CAHc6FU6_=S3up+mAmrcOOjpegoT98iJt0feAP=gfcEPaf6QxqQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: d2UeImxmMJizW8VV09RQ9A-1
X-MC-Unique: LOWk_7m5NI6kw4LIL4HU1Q-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAIHrXkx027446
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2] gfs2: Introduce function
	gfs2_withdrawn
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 3:39 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This version incorporates Andreas's suggestion.

Okay, pushed.

Thanks,
Andreas


