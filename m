Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96C713F3015
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 17:49:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-nkstD9PTPjC0CFsf7EsZtA-1; Fri, 20 Aug 2021 11:49:38 -0400
X-MC-Unique: nkstD9PTPjC0CFsf7EsZtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22DFB192D78B;
	Fri, 20 Aug 2021 15:49:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1583D1B400;
	Fri, 20 Aug 2021 15:49:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2FEA4BB7B;
	Fri, 20 Aug 2021 15:49:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KFnVGx031162 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 11:49:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 904E410545E6; Fri, 20 Aug 2021 15:49:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89C2C117DB3C
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:49:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C9718A01A0
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:49:28 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [185.58.86.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-586-j1vtT7VOOSugLHAASO2F8g-1;
	Fri, 20 Aug 2021 11:49:25 -0400
X-MC-Unique: j1vtT7VOOSugLHAASO2F8g-1
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-131-DAGKzonBN4SYNa4fYJu3Dw-1; Fri, 20 Aug 2021 16:49:23 +0100
X-MC-Unique: DAGKzonBN4SYNa4fYJu3Dw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft
	SMTP Server (TLS) id 15.0.1497.23; Fri, 20 Aug 2021 16:49:22 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
	AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
	15.00.1497.023; Fri, 20 Aug 2021 16:49:22 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Jeff Layton'" <jlayton@kernel.org>, "torvalds@linux-foundation.org"
	<torvalds@linux-foundation.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v2 1/2] fs: warn about impending deprecation of mandatory
	locks
Thread-Index: AQHXlctJ2CxbK7rVbku/gUAYi8DQHat8icSQ
Date: Fri, 20 Aug 2021 15:49:22 +0000
Message-ID: <c1318459eaab436aacb225982c49c4b4@AcuMS.aculab.com>
References: <20210820135707.171001-1-jlayton@kernel.org>
	<20210820135707.171001-2-jlayton@kernel.org>
In-Reply-To: <20210820135707.171001-2-jlayton@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17KFnVGx031162
X-loop: cluster-devel@redhat.com
Cc: "bfields@fieldses.org" <bfields@fieldses.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>, "w@1wt.eu" <w@1wt.eu>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"luto@kernel.org" <luto@kernel.org>, "v9fs-developer@lists.sourceforge.net"
	<v9fs-developer@lists.sourceforge.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>
Subject: Re: [Cluster-devel] [PATCH v2 1/2] fs: warn about impending
 deprecation of mandatory locks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jeff Layton
> Sent: 20 August 2021 14:57
> 
> We've had CONFIG_MANDATORY_FILE_LOCKING since 2015 and a lot of distros
> have disabled it. Warn the stragglers that still use "-o mand" that
> we'll be dropping support for that mount option.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/namespace.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index ab4174a3c802..ffab0bb1e649 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1716,8 +1716,16 @@ static inline bool may_mount(void)
>  }
> 
>  #ifdef	CONFIG_MANDATORY_FILE_LOCKING
> +static bool warned_mand;
>  static inline bool may_mandlock(void)
>  {
> +	if (!warned_mand) {
> +		warned_mand = true;
> +		pr_warn("======================================================\n");
> +		pr_warn("WARNING: the mand mount option is being deprecated and\n");
> +		pr_warn("         will be removed in v5.15!\n");
> +		pr_warn("======================================================\n");
> +	}
>  	return capable(CAP_SYS_ADMIN);
>  }

If that is called more than once you don't want the 'inline'.
I doubt it matters is not inlined - hardly a hot path.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


