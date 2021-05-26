Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E7CC2391B2E
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 17:07:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-WroeqWhpNWuJ7OS_MIYj7g-1; Wed, 26 May 2021 11:07:00 -0400
X-MC-Unique: WroeqWhpNWuJ7OS_MIYj7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A3258049CA;
	Wed, 26 May 2021 15:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37662682AC;
	Wed, 26 May 2021 15:06:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D14AF55342;
	Wed, 26 May 2021 15:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QF6txq031863 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 11:06:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E18FD103CB9; Wed, 26 May 2021 15:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC756103CC3
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 15:06:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60EB9185A79C
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 15:06:52 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-120-H674MX5gPqqO9NnaKxzyPw-1; Wed, 26 May 2021 11:06:48 -0400
X-MC-Unique: H674MX5gPqqO9NnaKxzyPw-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	14QF4f8R196347; Wed, 26 May 2021 15:06:45 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 38pqfchh1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 May 2021 15:06:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	14QF13ut186017; Wed, 26 May 2021 15:06:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 38rehdb9cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 May 2021 15:06:44 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14QF25sA195849;
	Wed, 26 May 2021 15:05:38 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 38rehdass5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 May 2021 15:05:38 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14QF1hAD004468;
	Wed, 26 May 2021 15:01:43 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 May 2021 08:01:42 -0700
Date: Wed, 26 May 2021 18:01:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20210526150133.GQ1955@kadam>
References: <20210526134039.3448305-1-colin.king@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20210526134039.3448305-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 5CLh-ECD08lLS6id9XUgHywJZSufP6Bg
X-Proofpoint-GUID: 5CLh-ECD08lLS6id9XUgHywJZSufP6Bg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9996
	signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	spamscore=0 mlxscore=0
	malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
	adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011
	suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104190000 definitions=main-2105260102
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH][next] fs: dlm: Fix memory leak of
	object mh
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2021 at 02:40:39PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an error return path that is not kfree'ing mh after
> it has been successfully allocates.  Fix this by free'ing it.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/dlm/rcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
> index 085f21966c72..19298edc1573 100644
> --- a/fs/dlm/rcom.c
> +++ b/fs/dlm/rcom.c
> @@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
>  	if (rc_in->rc_id == 0xFFFFFFFF) {
>  		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
>  		dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
> +		kfree(mh);

Am I looking at the same code as you?  (I often am not able to review
your patches because you're doing development on stuff that hasn't hit
linux-next).  Anyway, to me this doesn't seem like the correct fix at
all.  There are some other things to free and the "mh" pointer is on
a bunch of lists so it leads to use after frees.

regards,
dan carpenter

